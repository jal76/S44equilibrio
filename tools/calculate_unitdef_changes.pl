#!/usr/bin/env perl
use v5.18.2;
use strict;
use warnings;
use Text::Diff::Parser;
use Data::Dumper qw(Dumper);

my $both_game_dirs = -d 'S44equilibrio.sdd' and -d 'spring1944.sdd';
die "run me from the same folder as S44equilibrio.sdd and spring1944.sdd\n" if !$both_game_dirs;

my $diff = `diff -ru spring1944.sdd/units S44equilibrio.sdd/units | grep -v "Only in" | grep -v "^\\s"`;
my $parser = Text::Diff::Parser->new(Diff => $diff);

my $digested_changes = {};
for my $change ($parser->changes) {
	my ($unit) = $change->filename1 =~ /\/(\w+)\.fbi$/;

	my $size = $change->size;
	for my $line (0 .. ($size - 1)) {
		my $diff_line = $change->text($line);
		my ($tag, $value) = $diff_line =~ /^\s*(\w+)=(\d+);/;
		if ($change->type eq 'REMOVE') {
			$digested_changes->{$unit}->{$tag}->{old} = $value;
		} elsif ($change->type eq 'ADD') {
			$digested_changes->{$unit}->{$tag}->{new} = $value;
		}
	}
}

for my $unit_name (sort keys %$digested_changes) {
	my $unit = $digested_changes->{$unit_name};
	say "--" x 10;
	say "$unit_name:";
	for my $tag (sort keys %$unit) {
		my $tag_values = $unit->{$tag};
		next if $tag_values->{old} eq $tag_values->{new};
		my ($old, $new) = @{$tag_values}{qw(old new)};
		my $percentage_change = 100 * (1 - $old / $new);
		my $sign = $percentage_change > 0 ? '+' : '';
		say sprintf("%s: %s --> %s (%s%.2f%%)", $tag, $old, $new, $sign, $percentage_change);
	}
}


#!/usr/bin/perl
use strict;
use warnings;

my $count = 0;
my @sub_sums;
my $num_subjects = 0;

while (my $line = <>) {
    chomp $line;
    my @fields = split(/\s+/, $line);
    next unless @fields;

    # 헤더 처리 (첫 번째 라인)
    if ($count == 0) {
        for (my $i = 0; $i < @fields; $i++) {
            printf "%-8s ", $fields[$i];
        }
        printf "%-8s %-8s\n", "총점", "평균";
        print "------------------------------------------------------------------------\n";
        $count++;
        next;
    }

    # 학생 데이터 처리
    my $id = $fields[0];
    my $name = $fields[1];
    $num_subjects = @fields - 2;
    my $student_sum = 0;

    printf "%-8s %-8s ", $id, $name;

    for (my $i = 2; $i < @fields; $i++) {
        printf "%-8d ", $fields[$i];
        $student_sum += $fields[$i];
        $sub_sums[$i - 2] += $fields[$i]; # 과목별 합계 배열 저장
    }

    my $student_avg = $student_sum / $num_subjects;
    printf "%-8d %-8.1f\n", $student_sum, $student_avg;
    $count++;
}

# 하단 과목 평균 출력
if ($count > 1) {
    my $total_students = $count - 1;
    print "------------------------------------------------------------------------\n";
    printf "%-17s ", "과목평균";
    foreach my $sum (@sub_sums) {
        printf "%-9.1f ", $sum / $total_students;
    }
    print "\n";
}

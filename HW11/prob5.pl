#!/usr/bin/perl
use strict;
use warnings;

# 수업자료 표준: 연관배열(해시) 선언
my %word_count;

print "단어를 입력하세요 (입력 종료 시 Ctrl+D 누르기):\n";

while (my $line = <>) {
    chomp $line;
    # 한 줄에 여러 단어가 공백으로 들어올 수 있으므로 분리 처리
    my @words = split(/\s+/, $line);
    
    foreach my $word (@words) {
        next if $word eq ""; # 빈 데이터 스킵
        $word_count{$word}++; # 연관배열 카운트 증가
    }
}

print "\n=========================\n";
print "  단어 수집 결과 (빈도 순 정렬)\n";
print "=========================\n";

# 키 값을 정렬하여 포맷 출력
foreach my $word (sort keys %word_count) {
    printf "%-15s : %d 회\n", $word, $word_count{$word};
}

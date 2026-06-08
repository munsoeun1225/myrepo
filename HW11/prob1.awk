#!/usr/bin/awk -f

# 헤더 처리
NR == 1 {
    printf "%-8s %-8s %-6s %-6s %-6s %-6s %-6s\n", $1, $2, $3, $4, $5, "총점", "평균"
    print "--------------------------------------------------------"
    next
}

# 데이터 처리 및 누적
{
    total = $3 + $4 + $5
    avg = total / 3
    printf "%-8s %-8s %-6d %-6d %-6d %-6d %-6.1f\n", $1, $2, $3, $4, $5, total, avg
    
    kor_sum += $3
    eng_sum += $4
    math_sum += $5
    count++
}

# 과목별 평균 출력
END {
    print "--------------------------------------------------------"
    printf "%-18s %-6.1f %-6.1f %-6.1f\n", "과목평균", kor_sum/count, eng_sum/count, math_sum/count
}

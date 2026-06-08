#!/usr/bin/awk -f

# 헤더 처리
NR == 1 {
    for (i = 1; i <= NF; i++) {
        printf "%-8s ", $i
    }
    printf "%-8s %-8s\n", "총점", "평균"
    print "------------------------------------------------------------------------"
    next
}

# 데이터 처리
{
    student_sum = 0
    num_subjects = NF - 2
    
    printf "%-8s %-8s ", $1, $2
    
    for (i = 3; i <= NF; i++) {
        printf "%-8d ", $i
        student_sum += $i
        sub_sum[i] += $i  # 과목별 합계를 배열에 누적
    }
    
    student_avg = student_sum / num_subjects
    printf "%-8d %-8.1f\n", student_sum, student_avg
    count++
}

# 배열을 이용한 과목별 평균 출력
END {
    print "------------------------------------------------------------------------"
    printf "%-17s ", "과목평균"
    for (i = 3; i <= (num_subjects + 2); i++) {
        printf "%-9.1f ", sub_sum[i] / count
    }
    print ""
}

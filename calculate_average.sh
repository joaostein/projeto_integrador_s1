#!/bin/bash

source init.sh

total_grade_sum=0
total_students=0

worst_student_grade=99999
best_student_grade=0

while read row; do

  name=`echo $row | cut -d ";" -f2`
  grade=`echo $row | cut -d ";" -f3`

  (( total_grade_sum += $grade ))
  (( total_students++ ))

  if [[ $grade -lt $worst_student_grade ]]; then
    worst_student_grade=$grade
    worst_student_name=$name
  fi

  if [[ $grade -gt $best_student_grade ]]; then
    best_student_grade=$grade
    best_student_name=$name
  fi
  
done < $database_path

overall_average=`echo "scale=2; $total_grade_sum / $total_students" | bc`

echo "O aluno: $worst_student_name possui a pior nota que é $worst_student_grade"
echo "O aluno: $best_student_name possui a melhor nota que é $best_student_grade"

echo "Média de todas as notas armazenadas é: $overall_average"
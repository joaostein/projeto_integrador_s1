#!/bin/bash

source init.sh

registration=000
name=""
grade=0

while [[ $registration -ne 999 ]]; do
  echo "Cadastro de alunos (999 p/ sair)"

  echo "Matrícula: "
  read registration

  if [[ $registration -ne 999 ]]; then
    echo "Nome: "
    read name

    echo "Nota: "
    read grade

    echo "$registration;$name;$grade" >> $database_path
  else
    clear
    echo "Você saiu com sucesso."
  fi
  clear
done
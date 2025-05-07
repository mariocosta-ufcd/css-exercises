#!/bin/bash

# Exemplo para o exercício "Grouping Selectors"
# Verifica se existe font-size 28px
grep -q "font-size:\s*28px" style.css || {
  echo "Falta 'font-size: 28px'"
  exit 1
}

# Verifica se há cor de fundo preta ou branca
grep -E -q "background-color:\s*(black|#000|rgb\(0, ?0, ?0\))" style.css || {
  echo "Falta 'background-color: black'"
  exit 1
}

# Verifica se há cor de fundo amarela
grep -E -q "background-color:\s*(yellow|#ff0|#ffff00|rgb\(255, ?255, ?0\))" style.css || {
  echo "Falta 'background-color: yellow'"
  exit 1
}

# Verifica se usa Helvetica ou Times New Roman
grep -E -qi "font-family:.*(Helvetica|Times New Roman)" style.css || {
  echo "Falta 'font-family: Helvetica ou Times New Roman'"
  exit 1
}

exit 0

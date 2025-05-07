#!/bin/bash

## 01

exercise_path="foundations/intro-to-css/01-css-methods"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 01 - Métodos de Adicionar CSS..."

pass=true

# Verifica se o div está estilizado via CSS externo
if grep -E 'div *\{[^}]*background[^}]*red[^}]*color[^}]*white[^}]*font-size[^}]*32px[^}]*text-align[^}]*center[^}]*font-weight[^}]*bold' "$css_file" > /dev/null; then
  echo "✅ div com CSS externo está correto"
else
  echo "❌ div com CSS externo está incorreto ou incompleto"
  pass=false
fi

# Verifica se há <style> no HTML (CSS interno)
if grep -q "<style>" "$html_file"; then
  echo "✅ CSS interno presente no HTML"
else
  echo "❌ CSS interno não encontrado no HTML"
  pass=false
fi

# Verifica se o p tem estilos via CSS interno
if grep -E '<style>.*p *\{[^}]*background[^}]*green[^}]*color[^}]*white[^}]*font-size[^}]*18px' "$html_file" -z > /dev/null; then
  echo "✅ p com CSS interno está correto"
else
  echo "❌ p com CSS interno está incorreto ou incompleto"
  pass=false
fi

# Verifica se o button tem estilo inline
if grep -E '<button[^>]*style="[^"]*background[^"]*orange[^"]*font-size[^"]*18px' "$html_file" > /dev/null; then
  echo "✅ button com estilo inline está correto"
else
  echo "❌ button com estilo inline está incorreto ou incompleto"
  pass=false
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 01"
  exit 0
else
  echo "❌ Alguns testes falharam no exercício 01"
  exit 1
fi

## 02

exercise_path="foundations/intro-to-css/02-class-id-selectors"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 02 - Selectores de Classe e ID..."

pass=true

# Verifica se existe uma classe partilhada entre elementos ímpares
if grep -q 'class="[^"]*odd[^"]*"' "$html_file"; then
  echo "✅ Classe comum encontrada para elementos ímpares"
else
  echo "❌ Classe comum para elementos ímpares não encontrada"
  pass=false
fi

# Verifica se existem IDs únicos para elementos pares
if grep -q 'id="second"' "$html_file" && grep -q 'id="fourth"' "$html_file"; then
  echo "✅ IDs únicos encontrados para elementos pares"
else
  echo "❌ IDs únicos para elementos pares não encontrados"
  pass=false
fi

# Verifica se o terceiro elemento tem múltiplas classes
if grep -E 'class="[^"]*odd[^"]*[^"]*larger[^"]*"' "$html_file"; then
  echo "✅ Terceiro elemento com múltiplas classes"
else
  echo "❌ Terceiro elemento não tem múltiplas classes"
  pass=false
fi

# Verifica se a classe comum tem o estilo correto no CSS
if grep -E '\.odd\s*\{[^}]*background[^:]*:[^;]*#[a-fA-F0-9]{3,6}[^;]*;[^}]*font-family[^}]*Verdana' "$css_file" > /dev/null; then
  echo "✅ Estilos corretos aplicados à classe comum (ímpar)"
else
  echo "❌ Estilos ausentes ou incorretos na classe comum"
  pass=false
fi

# Verifica se o segundo elemento tem a cor e tamanho de fonte corretos
if grep -E '#second\s*\{[^}]*color[^:]*:[^;]*[^;]*;[^}]*font-size[^:]*:[^;]*36px' "$css_file" > /dev/null; then
  echo "✅ Estilos corretos aplicados ao segundo elemento"
else
  echo "❌ Estilos ausentes ou incorretos no segundo elemento"
  pass=false
fi

# Verifica se o terceiro elemento tem tamanho 24px
if grep -E '\.larger\s*\{[^}]*font-size[^:]*:[^;]*24px' "$css_file" > /dev/null; then
  echo "✅ Tamanho 24px aplicado à classe adicional do terceiro elemento"
else
  echo "❌ Tamanho 24px ausente na classe do terceiro elemento"
  pass=false
fi

# Verifica se o quarto elemento está em negrito com fundo verde-claro
if grep -E '#fourth\s*\{[^}]*background[^:]*:[^;]*[^;]*;[^}]*font-size[^:]*:[^;]*24px[^}]*font-weight[^:]*:[^;]*bold' "$css_file" > /dev/null; then
  echo "✅ Estilos corretos aplicados ao quarto elemento"
else
  echo "❌ Estilos ausentes ou incorretos no quarto elemento"
  pass=false
fi

# Resultado final do exercício 2
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 02"
else
  echo "❌ Alguns testes falharam no exercício 02"
  exit 1
fi

## 03

exercise_path="foundations/intro-to-css/03-grouping-selectors"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 03 - Agrupar Selectores..."

pass=true

# Verifica se há duas classes únicas nos elementos
if grep -q 'class="item1"' "$html_file" && grep -q 'class="item2"' "$html_file"; then
  echo "✅ Classes únicas encontradas para ambos os elementos"
else
  echo "❌ Faltam classes únicas nos elementos"
  pass=false
fi

# Verifica se existe um seletor agrupado correto no CSS
if grep -E '\.item1,\s*\.item2\s*\{' "$css_file" > /dev/null; then
  echo "✅ Selector agrupado encontrado no CSS"
else
  echo "❌ Selector agrupado ausente ou com sintaxe incorreta"
  pass=false
fi

# Verifica se o seletor agrupado aplica a fonte e tamanho de letra corretos
if grep -A 5 -E '\.item1,\s*\.item2\s*\{' "$css_file" | grep -q "font-family:.*Helvetica.*Times New Roman.*sans-serif" && grep -A 5 -E '\.item1,\s*\.item2\s*\{' "$css_file" | grep -q "font-size: *28px" ; then
  echo "✅ Fontes e tamanho aplicados no seletor agrupado"
else
  echo "❌ Fontes e/ou tamanho não encontrados no seletor agrupado"
  pass=false
fi

# Verifica se o item1 tem fundo preto e texto branco
if grep -A 5 '.item1' "$css_file" | grep -q "background: *black" && grep -A 5 '.item1' "$css_file" | grep -q "color: *white"; then
  echo "✅ Estilos exclusivos aplicados ao item1"
else
  echo "❌ Estilos do item1 ausentes ou incorretos"
  pass=false
fi

# Verifica se o item2 tem fundo amarelo
if grep -A 5 '.item2' "$css_file" | grep -q "background: *yellow"; then
  echo "✅ Estilo exclusivo aplicado ao item2"
else
  echo "❌ Estilo do item2 ausente ou incorreto"
  pass=false
fi

# Resultado final do exercício 3
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 03"
else
  echo "❌ Alguns testes falharam no exercício 03"
  exit 1
fi

## 04

exercise_path="foundations/intro-to-css/04-chaining-selectors"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 04 - Chaining Selectors..."

pass=true

# Verifica se os seletores encadeados estão presentes
if grep -q '\.avatar\.proportioned' "$css_file"; then
  echo "✅ Selector encadeado .avatar.proportioned encontrado"
else
  echo "❌ Selector .avatar.proportioned não encontrado"
  pass=false
fi

if grep -q '\.avatar\.distorted' "$css_file"; then
  echo "✅ Selector encadeado .avatar.distorted encontrado"
else
  echo "❌ Selector .avatar.distorted não encontrado"
  pass=false
fi

# Verifica se a largura está correta para ambos
if grep -A 5 '\.avatar\.proportioned' "$css_file" | grep -q 'width: *300px'; then
  echo "✅ Largura correta para .avatar.proportioned"
else
  echo "❌ Largura incorreta para .avatar.proportioned"
  pass=false
fi

if grep -A 5 '\.avatar\.distorted' "$css_file" | grep -q 'width: *200px'; then
  echo "✅ Largura correta para .avatar.distorted"
else
  echo "❌ Largura incorreta para .avatar.distorted"
  pass=false
fi

# Verifica se a altura da imagem proporcionada é automática
if grep -A 5 '\.avatar\.proportioned' "$css_file" | grep -q 'height: *auto'; then
  echo "✅ Altura proporcional para .avatar.proportioned"
else
  echo "❌ Altura incorreta (esperado: auto) para .avatar.proportioned"
  pass=false
fi

# Verifica se a altura da imagem distorcida é fixa
if grep -A 5 '\.avatar\.distorted' "$css_file" | grep -q 'height: *400px'; then
  echo "✅ Altura fixa correta para .avatar.distorted"
else
  echo "❌ Altura incorreta para .avatar.distorted (esperado: 400px)"
  pass=false
fi

# Resultado final do exercício 4
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 04"
else
  echo "❌ Alguns testes falharam no exercício 04"
  exit 1
fi

## 05

exercise_path="foundations/intro-to-css/05-descendant-combinators"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 05 - Descendant Combinator..."

pass=true

# Verifica se há um selector com combinador de descendência (ex: div p)
if grep -E -q 'div[[:space:]]+p' "$css_file"; then
  echo "✅ Selector descendente 'div p' encontrado"
else
  echo "❌ Selector descendente 'div p' não encontrado"
  pass=false
fi

# Verifica as propriedades dentro do selector
if grep -A 5 'div[[:space:]]\+p' "$css_file" | grep -q 'background-color: *yellow'; then
  echo "✅ Fundo amarelo aplicado"
else
  echo "❌ Fundo amarelo não encontrado"
  pass=false
fi

if grep -A 5 'div[[:space:]]\+p' "$css_file" | grep -q 'color: *red'; then
  echo "✅ Cor de texto vermelha aplicada"
else
  echo "❌ Cor de texto vermelha não encontrada"
  pass=false
fi

if grep -A 5 'div[[:space:]]\+p' "$css_file" | grep -q 'font-size: *20px'; then
  echo "✅ Tamanho de fonte 20px aplicado"
else
  echo "❌ Tamanho da fonte incorreto"
  pass=false
fi

if grep -A 5 'div[[:space:]]\+p' "$css_file" | grep -q 'text-align: *center'; then
  echo "✅ Alinhamento centrado aplicado"
else
  echo "❌ Alinhamento centrado não encontrado"
  pass=false
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 05"
else
  echo "❌ Alguns testes falharam no exercício 05"
  exit 1
fi

## Block and Inline 01


exercise_path="foundations/block-and-inline/01-margin-and-paddin-1"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

pass=true
echo "🔍 Verificando exercício 01 - Margin e Padding..."

# Verifica se a margin da div.one é 12px
if ! grep -E "\.one\s*\{[^}]*margin\s*:\s*12px" "$css_file" > /dev/null; then
  echo "❌ .one não tem margin: 12px"
  pass=false
fi

# Verifica se padding da div.one é 32px
if ! grep -E "\.one\s*\{[^}]*padding\s*:\s*32px" "$css_file" > /dev/null; then
  echo "❌ .one não tem padding: 32px"
  pass=false
fi

# Verifica se padding da div.three é 32px
if ! grep -E "\.three\s*\{[^}]*padding\s*:\s*32px" "$css_file" > /dev/null; then
  echo "❌ .three não tem padding: 32px"
  pass=false
fi

# Verifica se div.three tem margin-left: auto e margin-right: 0 (alinhado à direita)
if ! grep -E "\.three\s*\{[^}]*margin-left\s*:\s*auto[^}]*margin-right\s*:\s*0" "$css_file" > /dev/null; then
  echo "❌ .three não está corretamente alinhado à direita com margin"
  pass=false
fi

# Verifica se há 48px entre div.two e div.three (tanto margin-top como margin-bottom válidos)
if ! grep -E "\.two\s*\{[^}]*margin-bottom\s*:\s*48px" "$css_file" > /dev/null && \
   ! grep -E "\.three\s*\{[^}]*margin-top\s*:\s*48px" "$css_file" > /dev/null; then
  echo "❌ Não foi encontrado espaço de 48px entre .two e .three"
  pass=false
fi

if $pass; then
  echo "✅ Teste 01-margin-and-padding-1 passou!"
else
  echo "❌ Teste 01-margin-and-padding-1 falhou!"
  exit 1
fi

## Block and Inline 02


exercise_path="foundations/block-and-inline/02-margin-and-paddin-2"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

pass=true

pass=true
echo "🔍 Verificando exercício 02 - Margin e Padding #2..."

# Verifica padding de 8px no .card
if ! grep -E "\.card\s*\{[^}]*padding\s*:\s*8px" "$css_file" > /dev/null; then
  echo "❌ .card não tem padding: 8px"
  pass=false
fi

# Verifica font-size 16px e padding 8px no .title
if ! grep -E "\.title\s*\{[^}]*font-size\s*:\s*16px" "$css_file" > /dev/null; then
  echo "❌ .title não tem font-size: 16px"
  pass=false
fi

if ! grep -E "\.title\s*\{[^}]*padding\s*:\s*8px" "$css_file" > /dev/null; then
  echo "❌ .title não tem padding: 8px"
  pass=false
fi

# Verifica padding 16px top/bottom e 8px left/right no .content
if ! grep -E "\.content\s*\{[^}]*padding\s*:\s*16px\s+8px" "$css_file" > /dev/null && \
   ! grep -E "\.content\s*\{[^}]*padding\s*:\s*8px\s+16px" "$css_file" > /dev/null; then
  echo "❌ .content não tem padding correto (16px vertical, 8px horizontal)"
  pass=false
fi

# Verifica centralização e padding na .button-container
if ! grep -E "\.button-container\s*\{[^}]*text-align\s*:\s*center" "$css_file" > /dev/null; then
  echo "❌ .button-container não está centrada com text-align: center"
  pass=false
fi

if ! grep -E "\.button-container\s*\{[^}]*padding\s*:\s*8px" "$css_file" > /dev/null; then
  echo "❌ .button-container não tem padding: 8px"
  pass=false
fi

# Verifica padding do botão grande (24px lateral, 8px vertical)
if ! grep -E "button\s*\{[^}]*padding\s*:\s*8px\s+24px" "$css_file" > /dev/null; then
  echo "❌ O botão não tem padding: 8px 24px"
  pass=false
fi

if $pass; then
  echo "✅ Teste 02-margin-and-padding-2 passou!"
else
  echo "❌ Teste 02-margin-and-padding-2 falhou!"
  exit 1
fi

## Cascade Fix

exercise_path="foundations/cascade/01-cascade-fix"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 01 - Corrigir a Cascata..."

pass=true

# Verifica que o HTML não foi alterado (por exemplo, não foi removido um botão ou classe esperada)
if ! grep -q '<button class="button secondary">' "$html_file"; then
  echo "❌ Estrutura esperada do HTML foi alterada (classe .button secondary em falta)"
  pass=false
else
  echo "✅ HTML mantém a estrutura esperada"
fi

# Verifica se as regras esperadas estão aplicadas — exemplo (ajustar conforme o CSS real):
# Espera-se que .button.secondary tenha cor de fundo azul e texto branco
if grep -A 5 '\.button\.secondary' "$css_file" | grep -q 'background: *blue' && \
   grep -A 5 '\.button\.secondary' "$css_file" | grep -q 'color: *white'; then
  echo "✅ Estilo correto aplicado ao botão secundário"
else
  echo "❌ Estilo do botão secundário incorreto (esperado: fundo azul, texto branco)"
  pass=false
fi

# Espera-se que .text em .container tenha font-weight bold — ajusta isto ao conteúdo real
if grep -A 5 '\.container .text' "$css_file" | grep -q 'font-weight: *bold'; then
  echo "✅ Texto com font-weight bold corretamente aplicado"
else
  echo "❌ font-weight: bold não aplicado corretamente ao texto"
  pass=false
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 01-cascade-fix"
else
  echo "❌ Alguns testes falharam no exercício 01-cascade-fix"
  exit 1
fi

## Flexbox 01 - Flex Center

exercise_path="foundations/flex/01-flex-center"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 01 - Flex Center..."

pass=true

# Verifica se o container tem display flex
if grep -A 5 '.container' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ display: flex aplicado ao container"
else
  echo "❌ display: flex não encontrado no container"
  pass=false
fi

# Verifica se há centralização com justify-content e align-items
if grep -A 5 '.container' "$css_file" | grep -q 'justify-content: *center'; then
  echo "✅ justify-content: center aplicado"
else
  echo "❌ justify-content: center ausente"
  pass=false
fi

if grep -A 5 '.container' "$css_file" | grep -q 'align-items: *center'; then
  echo "✅ align-items: center aplicado"
else
  echo "❌ align-items: center ausente"
  pass=false
fi

# Verifica se não há uso de margin ou position que ajude a centrar o .box (opcional para garantir só Flexbox)
if grep -A 5 '.box' "$css_file" | grep -E -q 'margin|position'; then
  echo "❌ Estilos de margin/position encontrados no .box — usar apenas Flexbox"
  pass=false
else
  echo "✅ Nenhum estilo externo usado no .box (apenas Flexbox)"
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 01-flex-center"
else
  echo "❌ Alguns testes falharam no exercício 01-flex-center"
  exit 1
fi

## Flexbox 02 - Flex Header

exercise_path="foundations/flex/02-flex-header"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 02 - Flex Header..."

pass=true

# Verifica se o header usa display: flex
if grep -A 5 'header' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ display: flex aplicado ao header"
else
  echo "❌ display: flex não encontrado no header"
  pass=false
fi

# Verifica se justify-content é usado (provavelmente space-between)
if grep -A 5 'header' "$css_file" | grep -E -q 'justify-content: *(space-between|space-around|space-evenly)'; then
  echo "✅ justify-content correto aplicado ao header"
else
  echo "❌ justify-content ausente ou incorreto no header"
  pass=false
fi

# Verifica se align-items centraliza verticalmente
if grep -A 5 'header' "$css_file" | grep -q 'align-items: *center'; then
  echo "✅ align-items: center aplicado ao header"
else
  echo "❌ align-items: center ausente no header"
  pass=false
fi

# Verifica se os links (ul) estão com flex horizontal
if grep -A 5 'ul' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ display: flex aplicado às listas (ul)"
else
  echo "❌ As listas (ul) não estão com display: flex"
  pass=false
fi

# Verifica se os elementos listados têm o margin/padding removido
if grep -A 5 'ul' "$css_file" | grep -q 'margin: *0' && grep -A 5 'ul' "$css_file" | grep -q 'padding: *0'; then
  echo "✅ Margin e padding removidos do ul"
else
  echo "❌ Margin ou padding do ul não foram removidos"
  pass=false
fi

# Verifica se não há uso de floats, inline-block ou position:absolute
if grep -qE 'float|inline-block|position: *absolute' "$css_file"; then
  echo "❌ Encontrado uso de float, inline-block ou position:absolute — não permitido"
  pass=false
else
  echo "✅ Sem uso de float, inline-block ou position:absolute (correto)"
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 02-flex-header"
else
  echo "❌ Alguns testes falharam no exercício 02-flex-header"
  exit 1
fi


## Flexbox 03 - Flex Header 2

exercise_path="foundations/flex/03-flex-header-2"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 03 - Flex Header 2..."

pass=true

# Verifica se o header tem display flex e centralização vertical
if grep -A 5 'header' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ display: flex aplicado ao header"
else
  echo "❌ display: flex não encontrado no header"
  pass=false
fi

if grep -A 5 'header' "$css_file" | grep -q 'align-items: *center'; then
  echo "✅ align-items: center aplicado ao header"
else
  echo "❌ align-items: center ausente no header"
  pass=false
fi

# Verifica se há containers para os lados esquerdo e direito com display: flex
if grep -q 'class="left-links"' "$html_file" && grep -A 5 '.left-links' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ Container .left-links com display: flex"
else
  echo "❌ Container .left-links ausente ou sem display: flex"
  pass=false
fi

if grep -q 'class="right-links"' "$html_file" && grep -A 5 '.right-links' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ Container .right-links com display: flex"
else
  echo "❌ Container .right-links ausente ou sem display: flex"
  pass=false
fi

# Verifica se há gap de 16px entre itens dentro de left/right-links (gap ou margin-right, por exemplo)
if grep -A 5 '.left-links' "$css_file" | grep -q 'gap: *16px'; then
  echo "✅ Gap de 16px aplicado aos itens de .left-links"
else
  echo "⚠️ Gap de 16px não identificado explicitamente em .left-links (verifica se foi feito com margin)"
fi

if grep -A 5 '.right-links' "$css_file" | grep -q 'gap: *16px'; then
  echo "✅ Gap de 16px aplicado aos itens de .right-links"
else
  echo "⚠️ Gap de 16px não identificado explicitamente em .right-links (verifica se foi feito com margin)"
fi

# Verifica se há padding geral no header (8px para afastar do edge)
if grep -A 5 'header' "$css_file" | grep -q 'padding: *8px'; then
  echo "✅ Padding de 8px aplicado ao header"
else
  echo "❌ Padding de 8px ausente no header"
  pass=false
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 03-flex-header-2"
else
  echo "❌ Alguns testes falharam no exercício 03-flex-header-2"
  exit 1
fi


## Flexbox 04 - Flex Information

exercise_path="foundations/flex/04-flex-information"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 04 - Flex Information..."

pass=true

# Verifica se o container principal dos items tem display flex e alinhamento horizontal
if grep -q 'class="info-container"' "$html_file" && grep -A 5 '.info-container' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ .info-container com display: flex"
else
  echo "❌ .info-container ausente ou sem display: flex"
  pass=false
fi

# Verifica se os itens têm largura de 200px
if grep -A 5 '.info-item' "$css_file" | grep -q 'width: *200px'; then
  echo "✅ Largura de 200px aplicada aos itens"
else
  echo "❌ Largura de 200px não encontrada nos itens"
  pass=false
fi

# Verifica se o texto está centrado nos itens
if grep -A 5 '.info-item' "$css_file" | grep -q 'text-align: *center'; then
  echo "✅ Texto dos itens centrado"
else
  echo "❌ Texto dos itens não está centrado"
  pass=false
fi

# Verifica se os itens estão espaçados entre si (gap de 52px ou equivalente)
if grep -A 5 '.info-container' "$css_file" | grep -q 'gap: *52px'; then
  echo "✅ Espaçamento entre itens (gap de 52px) aplicado"
else
  echo "⚠️ gap: 52px não encontrado — verificar se foi aplicado com margin nos itens"
fi

# Verifica se o título está centrado (text-align ou flex)
if grep -A 5 '.title' "$css_file" | grep -q 'text-align: *center'; then
  echo "✅ Título centrado"
else
  echo "❌ Título não está centrado"
  pass=false
fi

# Verifica se há espaço de 32px entre o título e os itens
if grep -A 5 '.title' "$css_file" | grep -q 'margin-bottom: *32px'; then
  echo "✅ Espaço de 32px entre o título e os itens"
else
  echo "⚠️ Espaço entre o título e os itens não encontrado como margin-bottom: 32px"
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 04-flex-information"
else
  echo "❌ Alguns testes falharam no exercício 04-flex-information"
  exit 1
fi


## Flexbox 05 - Flex Modal

exercise_path="foundations/flex/05-flex-modal"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 05 - Flex Modal..."

pass=true

# Verifica se o container principal usa display flex
if grep -A 5 '.modal' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ display: flex aplicado à .modal"
else
  echo "❌ display: flex não encontrado na .modal"
  pass=false
fi

# Verifica se o ícone azul está à esquerda e não encolhe
if grep -A 5 '.icon' "$css_file" | grep -q 'flex-shrink: *0'; then
  echo "✅ .icon está protegido contra encolhimento (flex-shrink: 0)"
else
  echo "⚠️ .icon pode estar a encolher — considera usar flex-shrink: 0"
fi

# Verifica se há padding interno na modal
if grep -A 5 '.modal' "$css_file" | grep -q 'padding: '; then
  echo "✅ Padding aplicado ao .modal"
else
  echo "❌ Padding não encontrado no .modal"
  pass=false
fi

# Verifica se header e botão de fechar estão no mesmo nível e alinhados com flex
if grep -q 'class="modal-header"' "$html_file" && grep -A 5 '.modal-header' "$css_file" | grep -q 'display: *flex'; then
  echo "✅ .modal-header com display: flex"
else
  echo "❌ .modal-header ausente ou sem display: flex"
  pass=false
fi

if grep -A 5 '.modal-header' "$css_file" | grep -q 'justify-content: *space-between'; then
  echo "✅ justify-content: space-between aplicado à .modal-header"
else
  echo "⚠️ .modal-header pode não estar a espaçar corretamente o título e o botão"
fi

# Verifica se o título está em negrito e com tamanho maior que o texto
if grep -A 5 '.modal-title' "$css_file" | grep -q 'font-weight: *bold'; then
  echo "✅ Título com font-weight: bold"
else
  echo "❌ Título não está em negrito"
  pass=false
fi

if grep -A 5 '.modal-title' "$css_file" | grep -q 'font-size: *[2-9][0-9]px'; then
  echo "✅ Tamanho de fonte maior aplicado ao título"
else
  echo "⚠️ Tamanho de fonte do título pode não ser suficientemente maior"
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 05-flex-modal"
else
  echo "❌ Alguns testes falharam no exercício 05-flex-modal"
  exit 1
fi

## Flexbox 06 - Flex Layout

exercise_path="foundations/flex/06-flex-layout"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 06 - Flex Layout..."

pass=true

# Verifica se o body é um flex container em coluna com 100vh
if grep -A 5 'body' "$css_file" | grep -q 'display: *flex' && \
   grep -A 5 'body' "$css_file" | grep -q 'flex-direction: *column'; then
  echo "✅ body com display: flex e flex-direction: column"
else
  echo "❌ O body não tem display: flex em coluna"
  pass=false
fi

# Verifica se o footer tem background cinzento claro
if grep -A 5 'footer' "$css_file" | grep -q 'background.*#eeeeee'; then
  echo "✅ footer com fundo #eeeeee"
else
  echo "❌ footer não tem o fundo #eeeeee"
  pass=false
fi

# Verifica se o header e footer têm padding
if grep -A 5 'header' "$css_file" | grep -q 'padding'; then
  echo "✅ padding aplicado ao header"
else
  echo "❌ header sem padding"
  pass=false
fi

if grep -A 5 'footer' "$css_file" | grep -q 'padding'; then
  echo "✅ padding aplicado ao footer"
else
  echo "❌ footer sem padding"
  pass=false
fi

# Verifica se os links são distribuídos nas extremidades (provavelmente com justify-content: space-between)
if grep -A 5 'header' "$css_file" | grep -E -q 'justify-content: *(space-between|space-around|space-evenly)'; then
  echo "✅ links no header distribuídos corretamente"
else
  echo "❌ links no header não estão distribuídos corretamente"
  pass=false
fi

if grep -A 5 'footer' "$css_file" | grep -E -q 'justify-content: *(space-between|space-around|space-evenly)'; then
  echo "✅ links no footer distribuídos corretamente"
else
  echo "❌ links no footer não estão distribuídos corretamente"
  pass=false
fi

# Verifica se o main tem conteúdo centrado (logo, input, buttons)
if grep -A 5 'main' "$css_file" | grep -q 'align-items: *center' && grep -A 5 'main' "$css_file" | grep -q 'justify-content: *center'; then
  echo "✅ Conteúdo centralizado no main"
else
  echo "❌ Conteúdo não está centralizado no main"
  pass=false
fi

# Verifica se há padding nos botões
if grep -E 'button\s*\{[^}]*padding\s*:' "$css_file" > /dev/null; then
  echo "✅ padding aplicado aos botões"
else
  echo "❌ Botões sem padding"
  pass=false
fi

# Verifica se há espaço entre o logo, input e botões (gap ou margin)
if grep -A 5 'main' "$css_file" | grep -q 'gap:'; then
  echo "✅ Espaçamento entre elementos aplicado via gap"
elif grep -q 'class="logo"' "$html_file" && grep -A 5 '.logo' "$css_file" | grep -q 'margin-bottom'; then
  echo "✅ Espaçamento aplicado com margin entre os elementos"
else
  echo "⚠️ Espaçamento entre logo, input e botões não identificado"
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 06-flex-layout"
else
  echo "❌ Alguns testes falharam no exercício 06-flex-layout"
  exit 1
fi


## Flexbox 07 - Flex Layout 2 (Holy Grail)

exercise_path="foundations/flex/07-flex-layout-2"
html_file="$exercise_path/index.html"
css_file="$exercise_path/style.css"

echo "🔍 Verificando exercício 07 - Holy Grail Layout..."

pass=true

# Verifica se o header tem font-size 32px e font-weight 900
if grep -A 5 'header' "$css_file" | grep -q 'font-size: *32px' && grep -A 5 'header' "$css_file" | grep -q 'font-weight: *900'; then
  echo "✅ Header com font-size 32px e font-weight 900"
else
  echo "❌ Header não tem os estilos esperados (font-size: 32px, font-weight: 900)"
  pass=false
fi

# Verifica se o header tem padding de 16px
if grep -A 5 'header' "$css_file" | grep -q 'padding: *16px'; then
  echo "✅ Padding de 16px aplicado ao header"
else
  echo "❌ Header não tem padding de 16px"
  pass=false
fi

# Verifica se o layout principal tem flex-direction: column (para empurrar o footer para baixo)
if grep -A 5 'body' "$css_file" | grep -q 'display: *flex' && \
   grep -A 5 'body' "$css_file" | grep -q 'flex-direction: *column'; then
  echo "✅ body com flex-direction: column"
else
  echo "❌ body não tem display: flex em coluna"
  pass=false
fi

# Verifica se o footer está centrado horizontal e verticalmente
if grep -A 5 'footer' "$css_file" | grep -q 'display: *flex' && \
   grep -A 5 'footer' "$css_file" | grep -q 'justify-content: *center' && \
   grep -A 5 'footer' "$css_file" | grep -q 'align-items: *center'; then
  echo "✅ Footer centrado horizontal e verticalmente"
else
  echo "❌ Footer não está corretamente centrado"
  pass=false
fi

# Verifica se a sidebar tem largura fixa e não encolhe
if grep -A 5 '.sidebar' "$css_file" | grep -q 'width: *300px' && \
   grep -A 5 '.sidebar' "$css_file" | grep -q 'flex-shrink: *0'; then
  echo "✅ Sidebar com largura fixa e sem encolher"
else
  echo "❌ Sidebar não tem largura fixa de 300px ou pode encolher"
  pass=false
fi

# Verifica estilo dos links da sidebar
if grep -A 5 '.sidebar' "$css_file" | grep -q 'font-size: *24px' && \
   grep -A 5 '.sidebar' "$css_file" | grep -q 'text-decoration: *none' && \
   grep -A 5 '.sidebar' "$css_file" | grep -q 'color: *white'; then
  echo "✅ Estilo correto aplicado aos links da sidebar"
else
  echo "❌ Os links da sidebar não têm o estilo correto (tamanho, cor ou sublinhado)"
  pass=false
fi

# Verifica se há padding de 16px na sidebar
if grep -A 5 '.sidebar' "$css_file" | grep -q 'padding: *16px'; then
  echo "✅ Padding de 16px aplicado à sidebar"
else
  echo "❌ Sidebar sem padding de 16px"
  pass=false
fi

# Verifica se a secção de cards tem padding de 48px
if grep -A 5 '.cards' "$css_file" | grep -q 'padding: *48px'; then
  echo "✅ Padding de 48px aplicado à secção .cards"
else
  echo "❌ Padding de 48px ausente na .cards"
  pass=false
fi

# Verifica se os cards estão em layout flex com wrap
if grep -A 5 '.cards' "$css_file" | grep -q 'display: *flex' && \
   grep -A 5 '.cards' "$css_file" | grep -q 'flex-wrap: *wrap'; then
  echo "✅ Cards com layout flex e flex-wrap"
else
  echo "❌ Cards não estão em flex ou falta flex-wrap"
  pass=false
fi

# Verifica se os cards têm largura definida (necessária para wrap funcionar)
if grep -A 5 '.card' "$css_file" | grep -q 'width: '; then
  echo "✅ Largura definida nos .card (necessária para wrap)"
else
  echo "❌ Os .card não têm largura definida"
  pass=false
fi

# Resultado final
if $pass; then
  echo "🎉 Todos os testes passaram para o exercício 07-flex-layout-2"
else
  echo "❌ Alguns testes falharam no exercício 07-flex-layout-2"
  exit 1
fi

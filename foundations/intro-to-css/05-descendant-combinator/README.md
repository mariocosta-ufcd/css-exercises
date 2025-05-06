# 👨‍👧 Exercício: Combinador de Descendência (Descendant Combinator)

Neste exercício vais praticar o uso do **combinador de descendência** em CSS, que permite aplicar estilos apenas a elementos que **estão dentro de outros** (ou seja, são seus "descendentes").

---

## 🎯 Objetivo

Aplicar estilos **apenas** aos parágrafos (`<p>`) que estão **dentro de um elemento `<div>`**.  
Todos os outros `<p>` **fora** da `<div>` **não devem ter estilo aplicado**.

---

## 📄 Regras a aplicar

| Alvo                                  | Estilos                                                              |
|---------------------------------------|----------------------------------------------------------------------|
| `p` dentro de `div` (descendentes)    | Fundo amarelo, texto vermelho, tamanho da fonte 20px, texto centrado |

> 💡 Usa **selectores de tipo** ou **de classe** — como quiseres praticar!  
> Também podes experimentar combinar os dois (ex: `div.exemplo p`).

---

## 👁️ Resultado Esperado

![Resultado Esperado](./desired-outcome.png)

---

## ✅ Autoavaliação

- Os parágrafos com o texto **"This should be styled"** estão com fundo amarelo e texto vermelho?
- Os parágrafos com o texto **"This should be unstyled"** continuam **sem qualquer estilo aplicado**?
- Usaste corretamente o **combinador de descendência** (ex: `div p`)?

---

Este exercício ajuda-te a compreender melhor **como o CSS aplica estilos com base na hierarquia dos elementos HTML**.  
Continua a praticar! 💪

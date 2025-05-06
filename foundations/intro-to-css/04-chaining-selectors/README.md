# 🔗 Exercício: Encadeamento de Selectores (Chaining Selectors)

📸 Créditos das imagens:  
- [Katho Mutodo](https://linktr.ee/photobykatho_)  
- [Andrea Piacquadio](https://www.pexels.com/@olly?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

---

## 🎯 Objetivo

Neste exercício vais praticar o **encadeamento de selectores CSS** (ou chaining), ou seja, aplicar estilos a elementos **que têm duas classes ao mesmo tempo**.

---

## 📄 O que deves fazer

1. Estás a trabalhar com **duas imagens**, cada uma com duas classes atribuídas:
   - Ambas têm a classe `avatar`
   - Cada uma tem uma segunda classe diferente: `proportioned` ou `distorted`

2. O teu objetivo é:
   - Aplicar estilos **específicos a cada combinação de classes**
   - Sem afetar as imagens originais (que servem apenas como referência visual)

---

## 📝 Estilos a aplicar

| Classe combinada              | Estilos                                                                 |
|------------------------------|-------------------------------------------------------------------------|
| `.avatar.proportioned`       | Largura: `300px`, altura: proporcional (não uses valor fixo em px!)     |
| `.avatar.distorted`          | Largura: `200px`, altura: `400px` (altura fixa, o dobro da largura)     |

> 💡 Usa `height: auto;` para manter proporção, e valores fixos para distorcer.

---

## 👁️ Resultado Esperado

![Resultado Esperado](./desired-outcome.png)

As duas imagens estilizadas devem aparecer ao lado das imagens originais, que **não devem ser alteradas**.

---

## ✅ Autoavaliação

- Usaste **selectores encadeados corretamente**, como `.avatar.proportioned`?
- A imagem `proportioned` mantém proporção quadrada?
- A imagem `distorted` está visivelmente esticada verticalmente?

---

Este exercício ajuda-te a escrever CSS mais preciso e seletivo!  
Boa prática! 💪
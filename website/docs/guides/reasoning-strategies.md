---
sidebar_position: 3
title: Reasoning Strategies
---

# Reasoning Strategies

Reasoning strategies force AI to follow specific cognitive patterns before providing an answer. Use them in prompts to improve output quality for different task types.

## Core Reasoning Models

| Strategy | Full Name | Approach | Best For |
|----------|-----------|----------|----------|
| **CoT** | Chain-of-Thought | Sequential logical steps | Math, planning, logic puzzles |
| **ToT** | Tree-of-Thought | Parallel branching paths | Creative writing, strategic planning |
| **AoT** | Atom-of-Thought | Decomposition into atomic parts | Coding, proofs, verifiable tasks |
| **CoD** | Chain-of-Draft | Iterative drafting/refinement | Long-form content, essays |

## Evaluation & Refinement Strategies

| Strategy | Full Name | Approach | Best For |
|----------|-----------|----------|----------|
| **Reflexion** | Reflexion | Self-critique and error correction | Code debugging, quality review |
| **Self-Refine** | Self-Refinement | Iterative self-improvement | Polishing drafts, creative work |
| **Self-Consistent** | Self-Consistency | Multiple attempts + consensus | High-precision factual tasks |

## Task-Specific Strategies

| Strategy | Full Name | Approach | Best For |
|----------|-----------|----------|----------|
| **LTM** | Least-to-Most | Simple to complex sub-problems | Educational tasks, multi-part problems |
| **Standard** | Standard | Direct response | Simple queries, fast summaries |

---

## Detailed Strategy Breakdown

### Chain-of-Thought (CoT)

**How it works:** Instructs the model to "think out loud" step-by-step.

**Why use it:** Greatly reduces hallucinations in logic and math by making intermediate steps explicit.

**Prompt pattern:**
```
Let's think through this step by step:
1. First, I'll...
2. Then...
3. Finally...
```

**Best for:** Mathematical problems, planning sequences, logical deductions

---

### Tree-of-Thought (ToT)

**How it works:** The model considers multiple potential directions, evaluates them, and selects the most promising path.

**Why use it:** Perfect when there isn't one "correct" first step, or when you need diversity of ideas before narrowing down.

**Prompt pattern:**
```
Consider multiple approaches:
- Approach A: [description]
- Approach B: [description]
- Approach C: [description]

Evaluate each and select the best path forward.
```

**Best for:** Creative writing, strategic decisions, architectural choices

---

### Atom-of-Thought (AoT)

**How it works:** Breaks a large problem into completely independent sub-tasks that could theoretically be solved in isolation.

**Why use it:** Essential for complex software engineering where you need to define interfaces, data structures, and logic separately but cohesively.

**Prompt pattern:**
```
Break this into independent components:
1. [Component A] - can be implemented standalone
2. [Component B] - independent of A
3. [Integration] - how A and B connect
```

**Best for:** System design, API design, modular code, mathematical proofs

---

### Chain-of-Draft (CoD)

**How it works:** Generates an initial draft, then iteratively refines it through multiple passes.

**Why use it:** Produces higher quality long-form content by separating generation from refinement.

**Prompt pattern:**
```
Draft 1: Write initial version
Draft 2: Improve clarity and flow
Draft 3: Polish language and style
Final: Review and finalize
```

**Best for:** Documentation, essays, complex explanations, technical writing

---

### Reflexion

**How it works:** The model generates a response, critiques it for flaws, then generates a final response based on that critique.

**Why use it:** When "first draft" quality isn't enough and you need the model to "check its own work."

**Prompt pattern:**
```
1. Generate initial solution
2. Critique: What could go wrong? What's missing?
3. Revise based on critique
4. Final answer
```

**Best for:** Code review, bug finding, quality assurance, critical analysis

---

### Self-Consistent

**How it works:** Generates multiple independent attempts at the same problem, then finds consensus.

**Why use it:** When you need high confidence in factual accuracy.

**Prompt pattern:**
```
Attempt this problem 3 different ways.
Compare the results.
Report the answer that appears most consistently.
```

**Best for:** Fact-checking, calculations, verifiable claims

---

## Strategy Selection Guide

| If the task is... | Use Strategy |
|-------------------|--------------|
| "Solve this complex equation" | CoT |
| "Architect a new microservice" | AoT |
| "Give me 5 different story angles" | ToT |
| "Make this code bug-free" | Reflexion |
| "Verify this fact is correct" | Self-Consistent |
| "Write a detailed technical doc" | CoD |
| "Explain this concept step-by-step" | LTM |
| "Quick summary of this file" | Standard |

---

## Combining Strategies

Strategies can be combined for complex tasks:

**Example: Code Review**
1. **AoT** - Break code into reviewable components
2. **Reflexion** - Self-critique each component
3. **CoT** - Walk through logic step-by-step

**Example: Technical Documentation**
1. **ToT** - Consider multiple organizational approaches
2. **CoD** - Draft and refine content
3. **Reflexion** - Critique for completeness

---

## Using in Prompts

### Explicit Strategy Request

```markdown
Use Chain-of-Thought reasoning to solve this problem.
Think through each step explicitly before giving the answer.
```

### Implicit Strategy Cues

```markdown
Before answering, consider multiple approaches and evaluate each.
```

```markdown
Generate a solution, then critique it for potential issues,
then provide a revised solution.
```

---

## Summary

| Need | Strategy | Key Phrase |
|------|----------|------------|
| Step-by-step logic | CoT | "Think through step by step" |
| Multiple options | ToT | "Consider multiple approaches" |
| Modular decomposition | AoT | "Break into independent parts" |
| Quality iteration | CoD | "Draft, then refine" |
| Self-checking | Reflexion | "Critique your solution" |
| High accuracy | Self-Consistent | "Try multiple times, find consensus" |

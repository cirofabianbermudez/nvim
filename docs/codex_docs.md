# Codex

There are multiple ways to use ChatGPT tools but the most important one is the
app that you can install in macOS or Windows, if you don't want to deal later
with the terminal this is the best way. Nevertheless I think that using the CLI
is the way to go for power users.

The basic use case for general questions, similar to Google is open the app and
ask a simple question. A more advance usage is to select the ChatGPT Work mode
or Codex. Codex is a little bit more technical and gives you more details, so in
that sense Codex is better, for now this is what we're going to use.

There core concept when using any AI is **Prompting**.

Prompting is how you tell the AI what you want to know, make, or change.
A prompt can be a question, an instruction, or a goal.

A short prompt is often enough. For larger or more important tasks, include the
parts that matter:

- Goal: What should ChatGPT do?
- Context: What information or sources will help?
- Output: What format, length,  or level of detail do you need?
- Boundaries: What must stay unchanged? What should ChatGPT avoid or check with
  you before it acts?


Another important part is to add useful context:

- Add only resources that matter and explain what should be taken from each one.

Set boundaries that prevent problems:

- Boundaries are instructions that avoid creating extra work or taking actions
  you didn't intended.


## Slash commands

Again the best way to work with ChatGPT in using the CLI. To open it use the
command:

```bash
codex
```
from inside you can start working right away but it could be useful to know two
interesting command first.


### `/plan`

This command helps you you use ChatGPT as a planner, it does not modifies
anything in the code base, but helps you divide the work in multiple steps.

```bash
/plan
```

### `/goal`

After a plan is available, you can use this command to declare goals and follow
them.

```bash
/goal
```

To have everything well organize in the CLI, it's a good idea to use the
`/rename` command to give unique names to the chats command to give unique names
to the chats, then with the `/resume` command you can re-enter a existing chat.
If you want to remove a chat you can use `/archive` to archive it, `codex
unarchive "name of the chat"` of permanently delete the chat with `/delete`,
or `codex delete "name of chat"`

To start a new chat with a particular name use `/name <some-name>`


## 1. AI Foundations

ChatGPT can help you with:

- Drafting
- Summarizing
- Explaining
- Planning
- Brainstorming
- Organizing ideas

### 1.2 Learn with ChatGPT

Prompt

The question or instruction you give to ChatGPT is often referred to as a
prompt. Prompting is about shaping your language to get useful results from AI
models. You do not need a technical background to be good at it. Prompting is
simply good communication.

1. Explain a concept in simpler terms
2. Give examples related to your role, studies, or interests
3. Help you practice something covered in the course
4. Quiz you on a topic you just studied
5. Suggest ways you could apply AI in your own work

An example of a nice prompts is:

```
Hi, I’m Ciro Bermudez. I work in INFN Bari as a PhD student, and I’m taking an
AI Foundations course to better understand how to use tools like ChatGPT
effectively. I want to practice using ChatGPT for this task: Find information
related to High Energy Physics and UVM Verification to add it in my
bibliography. Help me connect the ideas to this task. Help me connect the ideas
to this task.
```

### 2.1 What is AI?

Artificial Intelligence AI is a broad term that:

- Recognize patterns
- Make predictions
- Organize information

| Concept | Explanation |
|---|---|
| Artificial Intelligence (AI) | The broad category of computer systems that can recognize patterns, make predictions, and help generate or organize information |
| Large Language Model (LLM)   | A type of AI that works with language |
| ChatGPT	| A OpenAI product that makes a large language model easier to use |

### 2.2 What LLMs can do

A language model is a type of AI model that works with language. Large Language
Models learn patterns from many examples of how people write, explain, and
organize information.

LLM Large Language Models is a type of AI that works with language.

An advance AI system designed to process, understand, and generate human
language. These models are trained on massive text datasets and use probability
to predict and generate the next word in a sequence.

The model has learned patterns in language. When you ask a question, the model
does not answer all at once. It builds a response one step at a time by
predicting what word or phrase is likely to come next.

Input > Model Prediction > Output

Each new word becomes part of the context for the next prediction. Over many
small steps, the model creates a full response.

This is sometimes described as prediction, not retrieval. The model is not
simply pulling a stored answer from a database. It is generating a response
based on patterns, instructions, and context.

The examples above show kinds of work modern AI systems can help with. But the
real value becomes clearer when you look at how AI supports specific workflows
inside real jobs.

Example of prompt:

```
Help me understand what kinds of economically valuable work modern AI systems
are genuinely good at inside real enterprise workflows.
```

```
Write an out-of-office message in the format of a poem.
```

Notice how the response follows both the task and the format. This works because
the model is predicting text that fits the pattern you asked for.

How ChatGPT works in everyday use:

| What the model does                 | What this means in practice                                                                                                 |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Predicts language based on patterns | Clear instructions shape the kind of response ChatGPT gives, so say what you need, who it is for, and what good looks like. |
| Uses the conversation as context    | Details, examples, and background information can help ChatGPT give more relevant responses.                                |
| Generates fluent responses          | A response can sound confident and polished, but it still needs to be checked before you use it.                            |

### How models are trained

Models are trained in stages. Each stage helps explain why AI tools behave the
way they do. When we say a model “learns,” we mean it is trained to recognize
and use patterns in data. It does not learn or understand in the same way a
person does.

1. Pre-training
  Learns from text
  What happens: The model learns patterns from large amounts of text and other data
  Why it matters: It learns how language and information are commonly structured

2. Post-training
  Refined to be more helpful
  What happens: The model is refined using feedback, examples, and evaluations
  Why it matters: It gets better at following instructions and responding helpfully

3. Product experience
  Used in products like ChatGPT
  What happens: ChatGPT gives you a way to interact with the model through a simple interface, tools, and safeguards
  Why it matters: The model becomes easier to apply to everyday tasks like drafting, summarizing, and planning

4. Ongoing feedback
  Improved through research
  What happens: Researchers improve models over time
  Why it matters: Newer models can become more capable, useful, and safe


### 2.4 Know when to use trusted sources

Use ChatGPT as the workspace, not the source of truth. When a task needs
current, exact, or reliable information, start with a trusted source, search
result, or file. Then ask ChatGPT to help you work with that material — for
example, by summarizing it, explaining it, turning it into a checklist, drafting
from it, or comparing it.

Here, “search” means web search: checking up-to-date information online rather
than relying on memory.

Use trusted sources, files, or search when you need:

1. Current facts
2. Policies or legal guidance
3. Prices, dates, or schedules
4. Citations or links
5. Exact source material
6. Information that may have changed over time

Workplace examples

01. Draft from notes

Upload meeting notes and ask ChatGPT to turn them into a short follow-up email
with decisions and next steps.

02. Check current guidance

Start with an approved internal source when you need travel, expense, security,
HR, or legal guidance. Then use ChatGPT to summarize it or turn it into a
checklist.

03. Prepare a sourced briefing

Gather current, trusted sources first. Then ask ChatGPT to summarize the key
points, include links, and draft a short briefing for your team.


### 2.5 Why AI need human review

AI tools can be useful and still make mistakes.

Because an LLM generates responses based on patterns and context. It can
sometimes produce an answer that sound confident but is incomplete, outdated, or
incorrect. These incorrect or unsupported responses are sometimes called
hallucinations.

A plausible response generated by an AI model that is not properly grounded in
the right information.

Better prompts give better answers

Like any AI tool, an LLM has practical limits. It may not know recent
information, private details, or organizational context unless you provide them.
It may also give slightly different answers to the same prompt, and in long
conversations it may lose track of earlier details.

These limits are manageable, but they are why context, sources, and human review
matter.

- Less context

  Write an onboarding checklist for my company.

- More context

  ```
  Write an onboarding checklist for a new team member joining [insert
  organization name and industry]. Include sections for access to tools or
  systems, manager check-ins, role-specific training, team introductions, and
  goals for the first week. Ask me for any details you need about my
  organization before finalizing.
  ```

These examples show how adding context can reduce unsupported assumptions and
make the response easier to review.

You may notice that an AI model sometimes gives different responses to the same
prompt. This is normal. Language models generate responses by predicting and
selecting from multiple possible next words and phrases, so there is often more
than one valid way to answer a question. As a result, responses may vary in
their wording, examples, or level of detail while still being useful and
relevant. This flexibility helps AI adapt to different tasks, explore
alternatives, and support creative and complex work.


Example without context:

```
Write a table with all the 12 tenses that exist in English language with an
example and an explanation on when to use them. The explanation should contain
all the possible use cases and the examples should be in affirmative, negative
and question form.
```

Example with context:

```
Help me with my practice task: Write a table with all the 12 tenses that
exist in English language. Goal: improve clarity. Audience:  learners. The
output should help me summarize information. Include: examples and an
explanation on when to use each one of them. The explanation should contain all
the possible use cases and the examples should be in affirmative, negative and
question form. Ask me for anything important that is missing before finalizing.
```

Important add:
- Goal
- Audience
- Include
- Ask me anything important that is missing before finalizing

### 2.6 Check in

A Large Language Model (LLM) generates responses based on patterns,
instructions, and context. Better results come from grounding the model with the
right information and reviewing outputs before you use them.

- Generate: ChatGPT is useful for drafting, explaining, brainstorming, and
  organizing ideas.

- Ground: When details matter, provide context, files, search results, examples,
  or trusted sources.

- Review: Check important outputs for accuracy, fit, completeness, and source
  support.

### 3.1 Why clear instructions matter

Prompting is simply good communication.
People respond best to clear and specific instructions

Now that you have a basic understanding of what AI and large language models
are, let’s look at how to get better results from ChatGPT.

You’ll learn two practical habits:

1. Giving clearer instructions with Task, Context, and Expectation
2. Reviewing outputs with the CLEAR structure (Complete, Logical, Evidence, Audience, Relevant)
When you write a message to ChatGPT, you are giving direction. The clearer your direction, the easier it is for ChatGPT to understand what you need.

A vague prompt leaves ChatGPT to guess.

- Vague prompt

  ```
  Write a summary of this report
  ```

- Clearer prompt

  ```
  Summarize this report in three bullet points for [audience]. Focus on the most
  important findings, recommended action items, and anything that requires a
  decision. Use concise, plain language and include only the most important
  details.
  ```

Both prompts ask for writing help, but the second prompt gives ChatGPT a clearer
task, audience, tone, and length.


### 3.2 Task, Concept, and Expectation

A good prompt often has three parts:

Tasks > Context > Expectation

Task
What you want ChatGPT to do
"Write a short guide"

Context
Background ChatGPT should consider
"The guide is for someone new to AI"

Expectation
How the response should look or sound
"Use simple language and bullet points"

Example:

```
Write a shor guide, the guide is for someone new to AI, use simple language and
bullet points.
```

| Item | Details | Examples |
|---|---|---|
| **Task** | What you want ChatGPT to do | *Draft an email* |
| | | *Summarize these notes* |
| | | *Create a checklist* |
| | | *Explain this concept* |
| **Context** | Background ChatGPT should consider | *Who the output is for* |
| | | *Why you need it* |
| | | *What the audience already knows* |
| | | *Any relevant process, goal, or constraint* |
| **Expectation** | How the response should look or sound | *Format* |
| | | *Length* |
| | | *Tone* |
| | | *Level of detail* |

Example:

Task: Draft an email.

Context: It is for a colleague who missed today’s project meeting and needs the
key decisions.

Expectation: Use three bullets, a warm tone, and a clear next step.

Put together: 

```
Draft an email to a colleague who missed today’s project meeting.
Summarize the key decisions in three bullets, use a warm tone, and end with a
clear next step.
```

### 3.3 Review the output

Even with a strong prompt, ChatGPT may not get everything right on the first
try. That is why review matters.

Before you use an AI-generated response, pause and check whether it is accurate,
complete, relevant, and appropriate for your purpose.

Think of it like reviewing a first draft: look for what works, what is missing,
and what needs to improve.

For more structure, use CLEAR

| Meaning | Ask |
|---|---|
| **Complete** | Did it answer everything I asked for? |
| **Logical** | Does it make sense from start to finish? |
| **Evidence** | Is it accurate and grounded? Do I need to check sources? |
| **Audience** | Is it right for the person who will read or use it? |
| **Relevant** | Does it stay focused on the task? |


### 3.4 Improve the output

Activity: Using the CLEAR structure

1. Describe task
  What do you want to practice with ChatGPT?
  Task:
  Describe the task you want to practice with ChatGPT

2. Set the goal
  What should the finished response help you achieve?
  Goal: 
  Example: improve clarity, save time, create a useful time draft

3. Choose the audience
  Who should the output be written for?
  Audience:
  Example: customers, learners, managers, colleagues

4. Add intended use
  Tell ChatGPT what the output will be used for.
  Intended use:
  Example: write an email, plan a session, summarize information

5. Add specific details
  Include sections, requirements, or points to cover
  Specific sections or details
  Add any sections, details, requirements, or points you want included

```
Help me with my practice task: Create a 400 word text that explains how the
HLC at CERN works step by step. The goal is create a useful draft. The audience
is myself and thesis advisors. The output should help me improve my undestanding
on the topic and be useful for my PhD thesis. Include references, do not invent
facts. Ask me for anything important that is missing before finalizing.
```

Ask yourself:

1. Complete: Did it include everything I asked for?
2. Logical: Is the order clear?
3. Evidence: Are there any claims or assumptions I should check?
4. Audience: Would this work for the person or group it is for?
5. Relevant: Did it stay focused on the goal?

After a prompt you can use this to refine the output:

```
Review this output using CLEAR. Identify what is complete, what is unclear, what
may need verification, what should be adjusted for the audience, and what should
be revised before I use it.
```

Once it has generated an output, you can run:

```
Revise the output based on that review. Keep the parts that work, fix the gaps,
and tell me what I should still check myself.
```

Reflect

1. What improved after the revision?
2. What did you still need to adjust yourself?
3. Which CLEAR question was most useful?


### 3.6 Check-in

Recap Two habits can help you get better results: use Task, Context, and
Expectation to direct the work, and use CLEAR to review the work.

Task, Context, and Expectation: help you explain what you want, what it should
consider and how the response should look

CLEAR: helps you decide whether an output is complete, logical, grounded, right
for the audience and relevant

Refining: is part of the workflow. You can ask ChatGPT to revise, but you decide
what is ready to use.

### 4.1 Why context matters

There are many different types of context you can provide. A simple way to think
about context is:

- Explain the task
- Add source material or background
- Say what good looks like

Files, search, examples, and saved preferences are all ways to give ChatGPT
better context.

Sometimes a clear prompt is not enough. ChatGPT may still need more information to do the task well: a document, a policy, an example, a process, a style guide, or details about your audience.

A prompt tells ChatGPT what you want, but is not always sufficient. Context
gives ChatGPT more information about what it needs to do the task well. For most
tasks, useful context answers three questions:

- What are you trying to do?
- What information should ChatGPT use?
- What would a good response look like?

For example, this prompt gives clear direction:

```
Write a short internal announcement introducing a new AI resource hub for employees.
```

But ChatGPT may still need more context:

- What resources are included?
- Who is it for?
- What tone does the company use internally?
- Are there examples it should follow?
- How should employees access it?
- What action should they take?

Without that information, the response may sound polished but generic. It may
also include steps that do not match how things actually work.

Key idea

If a teammate would need certain information to do the task well,
ChatGPT probably needs it too.

Return to the practice task you chose at the beginning of the course. Ask
yourself: if a teammate were helping with this task, what would they need to
know before producing a useful first draft?

### 4.2 What context to add

Useful context is any information that helps ChatGPT reduce guessing. Files,
search, examples, and saved preferences are all ways to give ChatGPT better
context.

Start with a three-part check:

1. What is the task?
Provide the action you want ChatGPT to take.

2. What information should it use?
Provide background, files, sources, examples, audience, constraints, or goals.

3. What does good look like?
Provide format, tone, length, sections, criteria, or examples.

Then choose the context method that fits. Extra detail can make the response
less focused, so add what is relevant to the task. 

Simple test. Ask yourself:

What would someone need to know to do this well?

For example, if you ask ChatGPT to draft an onboarding checklist, it may need to
know the role, tools, required training, team norms, and first-week
expectations.

If you ask it to rewrite a message, it may need to know the audience, tone,
length, and what you want the reader to do next.

### 4.3 Use Files

Files are useful when ChatGPT needs to work with specific information, not just
general knowledge.

You can add a report, spreadsheet, policy, notes, template, past example, or
draft. This gives ChatGPT something concrete to summarize, compare, extract,
rewrite, or analyze.

Use files when the details matter, such as the wording in an approved policy,
the structure of a template, the data in a spreadsheet, or the decisions
captured in meeting notes.

Common ways to use files

| File type               | What ChatGPT can do                                               |
|-------------------------|-------------------------------------------------------------------|
| Report                  | Summarize key findings, risks, and recommended actions            |
| Spreadsheet             | Identify trends, outliers, or questions to investigate            |
| Policy                  | Turn requirements into a checklist or quick-reference guide       |
| Meeting notes           | Pull out decisions, owners, and action items                      |
| Template / past example | Rewrite a draft to follow the same structure and tone             |
| Draft document          | Suggest edits, identify gaps, or adapt it for a different audience|


How to get better results with files

When you provide a file, tell ChatGPT exactly how to use it.

Useful prompt

```
Use this file as source material. Summarize the three most important
findings, list any recommended actions, and flag anything that may need
follow-up.
```

```
Use this template as a model. Rewrite my draft so it follows the same structure
and tone.
```

Best practices

- Share only the files that are relevant to the task
- Tell ChatGPT what to look for or produce
- Check that the response reflects the file accurately
- Ask follow-up questions if something important is missing
- Use only information your organization allows you to share, and leave out
  private or confidential details that are not needed


1. Choose a source type
  Pick what ChatGPT should treat as the source material

  File:     Use this file as a source material.
  Document: Use this document as a source material.
  Source:   Use this source as a source material.

2. What needs extracting?
  Tell ChatGPT exactly what you want to pulled out
  What you need extracting:
  Example: key risks, action points, deadlines, decisions, useful quotes, and
  anything that need checking.

3. Name the audience
  Who is the summary for?
  Audience:
  Example: senior leaders, new starters, the project team, a client, or my
  manager

Real world example:

```
Use this document as source material. Summarize the most important points for
myself and my PhD supervisor. Include just chapter 1 and extract also the
references in a markdown table, and tell me what I should review before relying
on the summary.
```

The structure is:

Use this document as a source material.
Summarize the most important point for ....
Include ....
, and tell me what should review before relying on the sumary.

### 4.4 Use search

Files help ChatGPT work with materials you already have. Search when you need
current or external information.

Use it when you need:

- Recent information
- Public facts or examples
- Answers based on trusted sources
- Links or citations
- Information that may have changed over time

Search does not replace your judgment. It helps bring information into the
conversation so ChatGPT can help you summarize, compare, explain, or draft from
it.

When search is useful
You might use search to:

- Bring in information from sources before drafting
- Compare options
- Gather background on a topic
- Find recent examples
- Get public facts or examples

How to get better search results

Ask a clear question and tell ChatGPT what kind of sources or output you need.
It can look up information from the internet and bring back current sources for
you to review.

Examples:

```
Use search to find credible, recent examples of how people use AI at work.
Summarize the examples in simple terms and include links to the sources.
```

```
Use search to check the latest guidance on [topic]. Summarize what changed, cite
the sources, and tell me what I should verify before using the information.
```

### 4.5 Save useful preferences

Some context is useful for one task. Other context can help across many
conversations. That is where saved preferences, custom instructions, and memory
can help.

These features can make ChatGPT feel more useful over time, because it can
remember your preferences instead of asking you to repeat them each time.

Three ways to think about context

- Input
- Custom instructions
- Memory

Memory and custom instructions do not replace the context you give in each
conversation. They are best for recurring details; for important tasks, still
provide the specific information ChatGPT needs.

You stay in control

You choose what to share. You can update, review, or remove saved information.
If you want a fresh conversation that does not use memory, you can use a
temporary chat where available.

Example custom instructions

- Work context

```
I work in [role/team/industry]. Tailor examples and suggestions to my day-to-day
work, stakeholders, and business priorities.
```

- Tone and style

```
Keep responses professional, clear, and concise. Use plain English for a global
business audience.
```


- Writing support

```
When helping me write emails, messages, or documents, make the tone warm,
direct, and polished without sounding overly formal.
```

- Decision support

```
When I ask for advice, give a clear recommendation, explain the tradeoffs, and
call out any assumptions.
```

- Accuracy and clarity

```
If something is uncertain, say so clearly. Do not guess, and tell me what
information would make the answer stronger.
```

Real world to improve your flow:

```
Based on how I like to work, suggest a short set of custom instructions I
could use. Ask me two questions first so the suggestions are relevant.
```

Result to copy and paste in Settings > Personalization > Custom instructions

```
- Ask clarifying questions before starting when important context, constraints, audience, or goals are missing. Do not silently make important assumptions.
- Prioritize accuracy and verification over speed. For technical, scientific, or research-related claims, verify facts when possible and use reliable primary or authoritative sources.
- Never invent facts, references, citations, technical details, or results. Clearly distinguish verified information, reasonable inference, and uncertainty.
- When reviewing my work, identify what is correct, unclear, incomplete, potentially inaccurate, and what I should verify myself.
- For complex topics, explain ideas step by step and connect theory to practical examples. Assume I want to understand the reasoning, not just get the final answer.
- Preserve technical meaning when rewriting my text. Improve clarity, grammar, and structure without unnecessarily changing my terminology or making the writing sound artificially polished.
- Prefer structured answers with clear sections, tables, or bullet points when they improve understanding, but avoid unnecessary verbosity.
- When several approaches are possible, explain the important trade-offs and recommend one rather than simply listing options.
- For code and technical workflows, favor maintainable, conventional solutions and explain important design choices, assumptions, and possible failure cases.
- Tell me explicitly what I should still check or validate before using an answer in academic or professional work.
```

### 4.6 Check-in

Context helps ChatGPT do less guessing and produce more useful responses.

- Explain the task: Be clear about what you want ChatGPT to do.

- Provide the right context and sources: Supply the file, source, example,
  audience, goal, or constraint that matters.

- Define what good looks like: Tell ChatGPT the format, tone, level of detail,
  or review criteria.

- Review the result: Check that the response reflects the context accurately.

### 5.1 Use ChatGPT responsibly

Responsible use is not a separate step at the end of your work. It is a quick
pause before you begin.

Before you use ChatGPT, ask:

Is ChatGPT the right tool for this task, with the information I'm about to
share?

Most of the time, the answer will be straightforward. ChatGPT is often a good
fit for drafting, summarizing, brainstorming, organizing ideas, and improving
writing.

Other times, the task may involve private details, important decisions, or
outcomes that affect people. Those moments need a little more care.

A quick check has three parts:

1. Is this the right kind of task for ChatGPT to help with?
2. Am I sharing only the information that is needed and allowed?
3. How much human review does this output need before it is used?

ChatGPT can help you work more efficiently and sharpen your thinking. But you
stay in control. You decide what to share and whether the output is reliable
enough to use.

Choose the right task

Remember, ChatGPT can help you:

- Draft a first version of a message
- Summarize public / approved information
- Brainstorm ideas
- Organize notes
- Rewrite text for a different audience
- Create a checklist or outline
- Prepare questions for a meeting or discussion

Some tasks need more care. When the output could affect someone’s safety,
employment, finances, legal rights, medical care, access to essential services,
or well-being, a qualified person or team should stay closely involved.

ChatGPT can still support more consequential work. It can help you organize your
thinking, clarify language, prepare questions, or review information. But it
should not be the only thing you rely on when making important decisions.

A simple way to think about it:

Use ChatGPT to support thinking and drafting. Keep humans responsible for
decisions that affect people or carry higher risk.

### 5.2 Share information carefully

ChatGPT works best when you give it useful context. A good habit is to share
only what is needed and allowed for the task.

Follow your organization’s policies first, especially for internal data,
customer information, employee information, and approved AI tools. If you are
unsure whether something is allowed, check with an approved internal resource,
such as your manager, security team, legal team, or AI policy guidance.

Start with these questions:

Use only information your organization allows you to share, and leave out
private or confidential details that are not needed.

- Is this information needed for the task?
- Is there an approved source or process I should use instead?
- Could I remove, generalize, or anonymize details?
- Am I allowed to share it here?
- What policy or approval applies to this task?
- Could I use a template or fictional example instead?

Minimize and anonymize

In many cases, ChatGPT does not need exact sensitive details to help. You can
often use labels, summaries, fictional examples, templates, or generalized
details instead.

Instead, you can:

- Replace names with labels like “Customer A” or “Team B”
- Remove details that are not needed for the task
- Share only the relevant section of a document
- Generalize dates, locations, or identifiers when exact details are not required
- Use a template or fictional example instead of real private information

### 5.3 Keep yourself in the loop

ChatGPT can help you move faster, but it does not replace your judgment. Before
using or sharing an AI-generated response, take a moment to review it.

For most everyday tasks, a quick check may be enough:

- Are the facts right?
- Are names, dates, numbers, and details correct?
- Is the tone appropriate?
- Is anything missing?
- Does it align with your organization’s policies and expectations?

For more consequential work, do a more thorough review. That might mean checking
sources, asking a qualified person to review, or following an established
approval process.

Think of ChatGPT as a thought partner. It can help create a starting point. You
shape the final version using your context, expertise, and judgment.

Example:

Not safe

```
Rewrite this message to employee Maria Gomez about her performance. Include her
exact score and the issues listed here. ## References
```

Safer

```
Draft a generic template for giving performance feedback to an employee.
Keep the tone clear, respectful, and constructive. I will add the specific
details myself later.
```

Review intensity depends on the task:

| Situation                                                                                        | Review needed                                       |
|---------------------------------------------------------------------------------------------------|------------------------------------------------------|
| Brainstorming ideas for a team event                                                              | Light review                                          |
| Drafting a general update                                                                         | Review for accuracy, tone, and fit                    |
| Summarizing a public article                                                                      | Check that the summary reflects the source            |
| Working with private or confidential details                                                      | Follow internal policy and minimize what you share    |
| Drafting something that affects a person's rights, job, health, finances, or access to services   | Strong human review or approved process               |

Real example

```
I’m considering using ChatGPT for this task: Give me a summary of the CV of this
employee, focusing only in the technical skills for programming and the soft
skills that are good for team work. Help me assess it using three checks: task
fit, information sharing, and human review. Ask me any questions you need, then
recommend whether I should use ChatGPT, use it with safeguards, or keep a human
or approved process in the lead.
```

You need to use this structure:

I’m considering using ChatGPT for this task: ...
Help me assess it using three checks: task fit, information sharing, and human
review. Ask me any questions you need, then recommend whether I should use
ChatGPT, use it with safeguards, or keep a human or approved process in the
lead.

### 5.5 Check-in

Responsible use comes down to a quick pause before you begin: is ChatGPT the
right tool for this task, with the information I’m about to share?

Responsible use is part of the same workflow you have practiced throughout the
course: explain the task, provide only the context that is needed and allowed,
review the output, and decide what is ready to use.

Use three checks:

- Task: Is this an appropriate task for ChatGPT to help with?
- Information: Am I sharing only what is needed and allowed?
- Review: How carefully should a human check the output before it is used?

---


## 2. Applied AI Foundations

This is the second course from OpenAI and it focuses on learning how to do workflows.
The first thing to notice is that it present us with a new tab that we can use
to do more complex tasks.

| Tab  | Use it for                                                               | Examples                                                                                 | Availability                              |
|------|--------------------------------------------------------------------------|------------------------------------------------------------------------------------------|-------------------------------------------|
| Chat | Conversations, questions, search, and everyday tasks                     | Ask a question, explore an idea, find information, or work through a task                | Available across desktop, web, and mobile |
| Work | Focused knowledge work involving files, research, and creating materials | Work across many files, conduct research, or create and refine reports and presentations | Available to some users on web and mobile |

### 1.2 From single prompts to Workflows

A single prompt is useful when the task is small. For example:

- Rewrite this message to make it shorter
- Summarize these notes in three bullets
- Give me five ideas for a team activity

Workflows are different. They usually have a goal, inputs, steps, decisions, and
checkpoints. For example:

- Help me prepare a leadership briefing on my team's weekly activity and planned
  work
- Help me compare three clients and identify the one at rich of churn
- Help me track my team KPIs, and identify any patterns which could lead to
  missed goals

Those tasks need more than one response. They need a workflow

A workflow has five parts:

| Part          | Question                                     |
|---------------|----------------------------------------------|
| 1 - Goal      | What are you trying to accomplish?           |
| 2 - Context   | What does ChatGPT need to know?              |
| 3 - Steps     | What should happend first, next, and last?   |
| 4 - Steps     | When should a person review the work?        |
| 5 - Output    | What should be produced at the end?          |

Why one prompt is often not enough

A single prompt can get you a quick answer, but work-ready outputs usually need
more: clear goals, the right context, review, refinement, and decisions about
what to do next. Workflow design helps you build those steps in, so ChatGPT can
support the whole task rather than just produce a first draft.

### 1.3 The Mindset for Applied AI Work

Applied AI work is collaborative. ChatGPT can help you move through the work,
but you still guide the direction.

- Define the goal

  Give ChatGPT the same clarity you would give a new teammate. Explain what you
  are trying to do, who it is for, what success looks like, and what constraints
  matter.

- Start with a draft

  The first response is a starting point. You can ask follow-up questions, add
  missing context, change the format, and don’t be afraid to ask ChatGPT to try
  again.

- Review the output

  ChatGPT can help with structure, language, analysis, and ideas. You are
  responsible for validating assumptions, checking risks, and deciding what is
  accurate, useful, appropriate, and ready to use.

- Adjust as needed

  Sometimes ChatGPT will suggest something helpful you had not considered.
  Sometimes it will miss a constraint, make an assumption, or drift away from
  your goal. Both moments are useful. They tell you what to clarify next.

Example


- Less useful prompt

```
Help me prepare for my weekly meeting
```

- More useful prompt

```
Help me design a workflow for my weekly pipeline review and forecasting pack.
The pack goes to my sales team leader. They use this to identify risks that
could impact on existing KPI targets, individual sales prospects, and
prioritize tasks for the week ahead to mitigate. I want the workflow to pull
from our existing CRM system, flag any deals that have unexpected movement,
and produce an executive summary I can talk through in 5 minutes. 
```

The second prompt gives ChatGPT a clearer job. It also gives you a clearer way
to review the result.

Pause and Review
Before trusting the output generated by your prompt, always ask:

- Did AI make assumptions not supported by the data?
- Did it miss an important business constraint?
- Would you confidently present this in the meeting today?
- What requires human judgment before action is taken?

### 1.4 Choose your Workflow

Identifying a suitable workflow

As you progress from single prompts to using workflows, it’s important to choose
suitable workflows to start practicing with. The best workflow is not the
biggest or most important one. It's the one that is useful, realistic for you,
low-risk while you are learning, and easy to practice and iterate on as you go.

1. Useful (Solves a real problem)
2. Realistic (Fits your time, skill and resources)
3. Low risk (Easy to try and learn from)
4. Practiceable (Can repeat and improve consistently)
4. Selected workflow (The best fir to start now)

You want to choose something that:

- You do regularly (weekly is ideal)
- Has a clear outcome or deliverable
- Involves multiple steps or decisions
- Gives you opportunities to review and improve the work
- Can be practised without sharing highly sensitive information

Avoid workflows that are:

- Too broad
- Too infrequent
- Too high stakes
- Difficult to review or verify

| Less Suitable               | More Suitable                                  |
|-----------------------------|------------------------------------------------|
| Improve sales performance   | Prepare a weekly pipeline review               |
| Run marketing campaigns     | Create a weekly campaign update                |
| Manage project delivery     | Prepare a weekly project status report         |
| Improve customer experience | Analyze customer feedback and identify actions |

Explore workflows for your role In these next activities, you’ll choose a role
most closely related to your own role (or one that interests you), which you
will use as your practice scenario throughout this course. This role will be
associated with a typical recurring meeting that you would regularly need to
attend and prepare for.

| Role                  | Weekly Meeting                                  |
|-----------------------|-------------------------------------------------|
| Sales                 | Weekly Pipeline Review and Forecast             |
| Marketing             | Weekly Camapign Review and Forecast             |
| Legal                 | Weekly Risk Review and Horizon Scanning         |
| Comms                 | Weekly Communications Review and Forward Plan   |
| Data Science          | Weekly Insights Review and Next Experiments     |
| Business Ops          | Weekly Business Ops Review and Planning         |
| Finance               | Weekly Financial and Forecast                   |
| Technical Engineering | Weekly Engineering Sprint Review and Resourcing |

Tip: When using ChatGPT, use one single chat for every activity in this course.
Each activity builds on the AI Workflow Plan you create, so you can paste each
prompt as a normal follow up in the same conversation.

Preparation activity

Top tips

1. Keep it real... but don't overshare. Swap real names, numbers, and client
   identifiers
2. Keep it consistent… write your six lines around the version of the meeting
   that happens regularly, not an unusual one-off. These form the spine of your
   workflow


Meeting pack prompt builder

1. The meeting
    The name and the day of the week it occurs
2. The audience
    Who in the room or reads the pack, and what they decide from it
3. Top three inputs
    Three different data sources, documents or systems used for information
4. Top three decisions
    What the meeting decides to drive forward
5. The output
    What you take to the meeting: slides, a report, or key talking points.
6. The reality check
  What could go wrong if the wrong data was used or preparation was rushed.


Real example:

```
My role is: Technical Engineering
The meeting is: engineering delivery review
The audience is: engineering team and project manager The meeting needs to
support these decisions: which needs to be verified next, what other things
are critical to verify, what could be improved
My main inputs are: technical specification, verification source code, plots
The output I need to prepare is: slides for a presentation
The main risk if this is prepared poorly is: overconfident delivery estimates, missing technical constraints
Please turn this into a clear, reusable Weekly Meeting Context block. Keep it concise,
practical, and easy to refer back to throughout this course. Do not create the
full workflow plan yet.
```

Output:

```
Weekly Meeting Context

- Role: Technical Engineering
- Meeting: Engineering Delivery Review
- Audience: Engineering team and project manager
- Purpose: Review technical evidence and decide:
  - What must be verified next
  - What other critical checks are missing
  - What should be improved
- Core inputs: Technical specification, verification source code, and plots
- Required output: Concise presentation slides that connect findings to delivery implications
- Key risk: Overconfident delivery estimates or missed technical constraints caused by incomplete, unclear, or weakly supported verification
- Working principle: Clearly distinguish verified results, open questions, assumptions, constraints, and recommended next actions.
```

Checkpoint One

You now have your first reusable asset — the context of your meeting, and the
topics you need to prepare for it. Now identify the elements of your prep that
an AI workflow can help you with.

Then the next prompt is:

```
Using my Weekly Meeting Context Block, identify 3 to 5 specific parts of this
meeting preparation process that an AI workflow could improve. Keep them small
enough to practice, low risk, and useful to revisit throughout the course. For
each opportunity, explain:

1. What part of the preparation it improves
2. Why it is suitable for AI assistance
3. What the likely inputs would be
4. What useful output it could produce.
```

Output

```
AI Workflow Opportunities
1. Build a verification traceability table
Improves: Connecting technical requirements to available verification evidence.
Why suitable for AI: AI can extract requirements, match them with code and plots, and flag missing or ambiguous links. A human retains responsibility for confirming technical validity.
Likely inputs: Technical specification, verification test names or source-code summaries, and plot labels.
Useful output: A compact table showing each requirement, its verification method, available evidence, status, and unresolved gaps.
2. Summarize verification code
Improves: Understanding what the verification code actually tests—and what it does not test.
Why suitable for AI: AI can explain code structure, identify assumptions and boundary conditions, and translate implementation details into review-ready language.
Likely inputs: Relevant source files, test configuration, expected behavior, and specification sections.
Useful output: A short summary of test purpose, method, coverage, assumptions, limitations, and questions requiring engineering review.
3. Review plots for presentation readiness
Improves: Interpreting and communicating verification results clearly.
Why suitable for AI: AI can check whether plots have clear labels, units, limits, thresholds, and an understandable relationship to the requirement.
Likely inputs: Plots, captions, acceptance criteria, test conditions, and relevant specification references.
Useful output: A proposed finding for each plot, presentation improvements, and warnings where the evidence does not support a firm conclusion.
4. Generate candidate verification priorities
Improves: Deciding what should be verified next and which missing checks are most critical.
Why suitable for AI: AI can organize gaps using consistent criteria such as technical risk, uncertainty, dependency, delivery impact, and effort. The team should make the final prioritization.
Likely inputs: Verification status, known constraints, open issues, dependencies, delivery milestones, and risk information.
Useful output: A ranked shortlist of next verification activities with rationale, dependencies, and the decision each activity would enable.
5. Draft an evidence-based slide outline
Improves: Turning technical material into a focused delivery-review presentation.
Why suitable for AI: AI can consistently separate verified findings, assumptions, open questions, risks, and recommended actions while adapting the language for engineers and the project manager.
Likely inputs: Traceability table, code summary, plot findings, priority list, and meeting duration.
Useful output: A concise slide outline covering current evidence, constraints, gaps, delivery implications, proposed next checks, and decisions needed.
Before professional use, verify every AI-generated technical interpretation against the specification, code, test conditions, and responsible engineer’s judgment—especially any conclusion that affects delivery estimates.
```

Then you can select one of the outputs follow with:

```
Using my Weekly Meeting Context Block and this focus area: Generate candidate verification priorities, create a starter workflow outline only. Include:
1. A working goal
2. Likely inputs
3. Likely final output
4. 3 to 5 rough phases
5. Where human review is likely to be needed
Do not create a full workflow plan yet. We will build it step by step throughout the course.
```

Reflect

- What made the workflow useful?
- What might make it too broad?
- What information should you avoid sharing?
- Where will your judgment matter most?

What to remember

Applied AI work starts with a real goal. A good workflow is specific enough to
guide and small enough to practice.

### 1.5 Check-in

You have moved from thinking about ChatGPT as a tool for single prompts to
understanding how it can support a fuller, repeatable workflow.

You have seen that useful AI-assisted work starts with a clear goal, realistic
inputs, planned steps, review points, and a final output that you can
confidently use. You have also begun shaping your own Meeting Workflow Pack, so
your work with ChatGPT stays focused, grounded, and reusable. Remember these key
points:

- Why workflows matter: One prompt can give you a starting point, but it often
skips the thinking that makes work usable: clarifying the goal, adding context,
checking assumptions, reviewing quality, and deciding what to do next.

- Your role in the process: ChatGPT can help draft, structure, compare, and
suggest, but you remain responsible for checking accuracy, spotting assumptions,
and deciding what is ready to use.

- Defining your own workflow: You have explored how to choose a realistic weekly
meeting or work task, identify the key inputs and outputs, and keep the workflow
small enough to practise and improve.

### 2.1 When to Use Reasoning Models

You will know when to use reasoning, how it supports multi-step work, and how to
keep yourself in the loop when a task needs careful comparison, planning,
constraints, or review.

Quick tasks vs Reasong tasks

Quick task
    Rewrite this message to sound warmer

Reasoning task
    Compare three project options against cost timing, and risk, then recommend
    one and explain the tradeoffs

In Module 1, you chose your meeting workflow and started your AI Workflow Plan.
Some parts of that workflow may be quick, like rewriting a summary line or
drafting a short follow-up. A faster AI model may be sufficient for these tasks.

Other parts may need more in-depth consideration, like comparing options,
planning a sequence, weighing tradeoffs, or checking a recommendation against
criteria. These would benefit from more careful reasoning.

This AI model is better suited to tasks where the answer depends on structure,
constraints, comparison, trade-offs, or review.

Use a faster model when the task is simple and/or low-stakes.

Use a reasoning model when the task has:

- Several constraints
- Multiple possible paths
- A decision or recommendation
- A plan with dependencies
- A need to compare options
- A need to check work against criteria

| Capability  | How it helps                                                                                        |
|-------------|-----------------------------------------------------------------------------------------------------|
| Planning    | Break up a goal into phases, suggest an order, and identify what should happen before the next step |
| Constraints | Keep track of requirements like audience, time, format, policy, or available information            |
| Comparison  | Compare options against criteria instead of giving a generic list of pros and cons                  |
| Nuance      | Handle trade-offs, assumptions, and uncertainty more clearly                                        |
| Review      | Check a draft, plan, or analysis against the goal you set                                           |


                        ┌──────────────────────────┐
                        │  Is the task quick and   │
                        │       low stakes?        │
                        └────────────┬─────────────┘
                                     │
                     ┌───────YES─────┴─────NO────────┐
                     │                               │
                     ▼                               ▼
      ┌───────────────────────────┐   ┌───────────────────────────────┐
      │      Use a faster model   │   │  Does it involve steps,       │
      │      ─────────────────    │   │  trade-offs, constraints,     │
      │  Examples: Quick rewrite, │   │  or decisions?                │
      │  simple summary, short    │   └────────────────┬──────────────┘
      │  draft                    │                    │
      └───────────────────────────┘    ┌──────YES──────┴──────NO───────┐
                                       │                               │
                                       ▼                               ▼
                          ┌───────────────────────┐   ┌───────────────────────────────┐
                          │ Use a reasoning model │   │   Consider a faster model     │
                          │                       │   │   ────────────────────────    │
                          │                       │   │  Switch to a reasoning model  │
                          │                       │   │  if you're unsatisfied with   │
                          │                       │   │  the outcome                  │
                          └───────────────────────┘   └───────────────────────────────┘

Example:

Quick task

```
Rewrite this summary section of my weekly report to sound clearer
```

Reasoning task

```
Compare these three forecast scenarios for my weekly report against revenue
impact, risk, and confidence. Recommend one, and how the impact of trade-offs
can be limited
```


### 2.2 What Reasoning Models Help with


Reasoning is especially helpful when a task needs to stay organized across
multiple steps or criteria. 

It can help with five kinds of applied work, that build on each other as you
work through the reasoning stages.


                    ┌─────────────────────────┐
   Deliver ─────────┤  (5)   Review      [✓]  │
                    └─────────────────────────┘
        ▲
        │           ┌─────────────────────────┐
        │           │  (4)   Nuance      [⚡] │
        │           ├─────────────────────────┤
Reason  │           │  (3)   Comparison  [≣]  │
through │           ├─────────────────────────┤
        │           │  (2)   Constraints [::] │
        │           └─────────────────────────┘
        ▲
        │           ┌─────────────────────────┐
  Build up ─────────┤  (1)   Planning    [◐]  │
                    └─────────────────────────┘


Example:

Technical Engineering

```
Help me plan the analysis section of my weekly engineering review and release
readiness meeting, where I need to explain a [number] percent week-on-week
increase in production incidents and deployment failures. 
```

A useful reasoning model should:
- Clarify the goal
- Suggest a short agenda
- Identify decisions needed
- Flag risks
- Include a follow-up message
- Stay within the section length I have in the meeting



### 2.3 Keep Yourself in the Loop

Reasoning models can produce more structured work, but they still need your
direction.

┌────────────────────────┐         ┌────────────────────────┐         ┌────────────────────────┐
│ Your direction         │         │ Reasoning model        │         │ Structured output      │
│                        │         │                        │         │                        │
│ 1  Set the goal        │         │ Organise information   │         │ Clear plan             │
│ 2  Give context        │   -->   │ Checks logic           │   -->   │ Step-by-step answer    │
│ 3  Add guardrails      │         │ Builds structure       │         │ Useful framework       │
│                        │         │ Identifies gaps        │         │ More structured work   │
│                        │         │                        │         │                        │
└────────────────────────┘         └────────────────────────┘         └────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ Review and refine                                                                            │
│                                                                                              │
│    ┌──────────────────────┐       ┌──────────────────────┐       ┌──────────────────────┐    │
│    │ 1  Check response    │  -->  │ 2  Improve prompt    │  -->  │ 3  Iterate & repeat  │    │
│    └──────────────────────┘       └──────────────────────┘       └──────────────────────┘    │
│                                                                                              │
└──────────────────────────────────────────────────────────────────────────────────────────────┘

1. Set the goal

Explain what you want to accomplish and what a good output should do.

2. Supply context

Give the audience, background, source material, constraints, and any decisions
already made.

3. Provide guardrails

Say what ChatGPT should avoid. This might include sensitive data, unsupported
claims, policy issues, or actions that need approval.

4. Check the work

Review facts, assumptions, logic, tone, and fit for the audience.

5. Refine

Update your prompt on what you found. Re-run the part that didn’t work, and make
more of those parts that did work so you can reuse them in the next cycle.


### 2.4 Apply Reasoning to your Workflow

You now know when reasoning models are useful, what they can help with, and how
to stay in control of the final output.

Step 1 run this:

```
Here is my current weekly meeting workflow outline:
....
paste where your outline
....
Pick one phase of this workflow that would benefit most from a reasoning model.
Explain why this phase needs careful reasoning rather than a faster response.
Then write a stronger prompt I could use for that phase. Include: the goal, the
context, the constraints, the output format, and the review criteria I should
use. The finished prompt asks ChatGPT to choose the phase where a reasoning
model can add the most value, then write a stronger prompt for that phase.
```

The finished prompt asks ChatGPT to choose the phase where a reasoning model can
add the most value, then write a stronger prompt for that phase.


Step 2: create your reasoning note

```
Create a short Reasoning Note for my Weekly Meeting Workflow Pack.
Include:
the workflow phase where reasoning helps most,
why reasoning is useful there,
the prompt I can reuse for that phase,
what I need to verify myself,
what requires human judgment,
and what I might refine before next week’s meeting.
```

Checkpoint complete

You have now added a Reasoning Note to your Meeting Workflow Pack. Later in the
course, you’ll use this note when you build your full AI Workflow Plan.

### 2.5 Check-in

Reasoning models are not for every task. They are most useful when the work
benefits from planning before answering. Remember these key points:

- Use reasoning when a task has steps, constraints, trade-offs, or review criteria
- Use a faster model when the task is simple, quick, or low-stakes
- Ask it to surface assumptions, risks, and what you should verify
- Give the model a clear goal and enough context 
- Stay responsible for the final judgment


### 3.1 Reasoning and Tools

ChatGPT has lots of additional capabilities to support workflows. These
capabilities come in many forms (e.g. reasoning, apps, files, voice mode,
images, “etc”). You can layer capabilities or think of them as building blocks
to support more advanced work.

Reasoning and tools work together.

Reasoning helps ChatGPT work through structure, trade-offs, and review. Tools
help ChatGPT work with information or actions beyond the conversation. Almost
every meeting workflow uses a mixture of both.

Reasoning helps when the task needs structure, planning, comparison, or review.
Tools are used when the task needs specific information, current data, a file, a
spreadsheet, an image, audio, or a connection to another app.

Use reasoning when you need:

- Structure or planning
- Comparison
- Review
- Analysis
- Problem solving

Use tools when you need:

- Specific or current information
- Files or specific documents
- Spreadsheets or data
- Images or audio
- Connect to plugins

Example:

You are preparing your meeting pack.

1. Reasoning helps you plan the structure
2. Search helps you gather current information
3. Files help you summarize internal notes or approved source material
4. Data analysis helps you inspect a spreadsheet
5. Review helps you check the final draft against the goal

A simple way to think about it:

Reasoning models are designed to spend more time thinking through a problem
before responding. This helps them tackle complex tasks that require planning,
analysis, or multi-step problem solving. While they may take longer to generate
an answer, they can often produce more thorough and reliable results when the
task requires deeper reasoning.

### 3.2 Use Files and Data

Files and data are useful when ChatGPT needs to work with specific information,
not just general knowledge.

You might provide:

- A report
- A policy
- A spreadsheet
- A slide deck
- A transcript
- A set of meeting notes
- A CSV export
- A project brief

When you provide a file, tell ChatGPT how to use it.

Example

```
Use this file as source material. Summarize the three most important findings,
list recommended actions, and flag anything I should verify before relying on
the summary.
```

| File workflow | What ChatGPT can do                                  |
|---------------|------------------------------------------------------|
| Summarize     | Turn long material into a shorter brief              |
| Extract       | Pull out decisions, owners, risks, or themes         |
| Compare       | Compare two versions, options, or sources            |
| Verify        | Check whether a draft is supported by the source     |
| Transform     | Turn notes into a checklist, outline, email, or plan |

For data work, be clear about the columns, definitions, and questions you want
answered.

Example:

```
Use the attached to identify the top three trends, any outliers, and two
questions I should investigate before making a recommendation for the meeting.
Explain any assumptions you make.
```

### 3.3 Use Search and Deep Research

Use Search when you need current or external information. Use Deep Research when
you need a more thorough synthesis across sources.

This is just available in Chat mode:

When to use them:

Web search:

- Use Search for recent information, public facts or examples, links or
  citations, a quick source check, or a few trusted sources Search is useful
  when you need to bring current information into the conversation.

Deep research:

- Use Deep research for things like a developed research brief, multiple sources
  compared, different perspectives synthesized, or evidence before making a plan

- Deep Research is useful when the task is broader, more complex, or needs a
  structured synthesis across multiple sources.


Example:

If a section of your meeting pack needs research on a new topic:

- Use Search to check recent facts, examples, or source links.
- Use Deep Research if you need a fuller research brief with sources compared
  and findings organized.

You still need to review the result. Check the sources, the framing, and whether
the findings apply to your situation.


Example prompt:

```
Based on my weekly meeting workflow plan so far, identify whether any part
needs current, external, or source-backed information. For each relevant phase,
recommend Search, Deep Research, or neither. Explain what information I would
need, what sources I should check, and what I should verify before relying on
the output. Then update the plan’s source/research notes.
```

### 3.4 Use multimodal inputs

ChatGPT is a multimodal platform, which means it can work with more than typed
text. ChatGPT can work with images, screenshots, documents, and voice.

Images or screenshots

    - Understanding a chart or dashboard
    - Reviewing a visual layout
    - Extracting information from a screenshot
    - Comparing a visual to requirements
    - Explaining what is visible

    Looks like:

    Uploading the release dashboard or incident trend chart for the weekly
    engineering review and release readiness meeting and asking ChatGPT to flag the
    three production risks that have shifted most week-on-week

Documents

    - Summarizing long content
    - Finding key points
    - Comparing versions
    - Checking whether a draft is supported by a source

    Looks like:

    Pasting last week’s engineering review and release readiness pack and asking
    ChatGPT to extract every blocker, incident follow-up, and technical debt
    action still outstanding

Voice

    - Talking through an idea
    - Practicing an explanation
    - Capturing rough thoughts
    - Turning spoken context into a structured draft

    Looks like:

    Talking through the release risks, production incidents, and engineering
    blockers before the weekly engineering review and release readiness meeting and
    asking ChatGPT to turn the dictation into a structured release readiness
    briefing


Prompt example:

```
Look at this dashboard screenshot from my weekly inputs and identify the
three points most worthy of raising at the meeting. Focus on what looks like an
outlier, and what is missing context. Do not comment on visual style
```

### 3.5 Working with plugins

Plugins lets ChatGPT connect to other apps to gather more information.

Plugins can extend what ChatGPT can help you do.

A plugin can connect ChatGPT to another tool, such as your documents, calendar,
messages, files, project spaces, or workplace systems. Some plugins may also
include skills, which give ChatGPT reusable instructions for a specific kind of
work.

This means plugins can help ChatGPT work with more relevant context. For
example, a plugin might help you find information from a document, summarize
messages, review project files, or prepare a draft based on approved workplace
sources.

Plugins can make workflows more useful, but they also make boundaries more
important.

This can make workflows more useful. It also makes boundaries more important.

Examples: 

- Gmail
- Drive
- Teams
- Slack
- GitHub
- Asana
- Canva

Before using a plugin, pause and ask:

- What can the plugin access?
- What can the plugin do?
- What needs human approval?
- What policy applies?

Working with plugins responsibly:

1. Ask ChatGPT to find relevant content
2. Ask it to summarize what it found
3. Review the summary yourself
4. Ask it to draft an update or next step
5. Review before sending, creating, or changing anything

Plugins can connect the workflow, but they do not remove your responsibility to
review access, actions, and outcomes. This matters most when an plugin is
touching real meeting data or sending something on your behalf.

### 3.6 Choose the Right Capability

| Format | Capabilities                                                                                                                                 | Sources                                                                           | Apps                                                     |
|--------|----------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------------------------------------|
| Data   | File uploads, Spreadsheets, Dashboards, CSV analysis<br>Task context, Trend analysis, Comparison, Summarization                              | Excel databases, CSV files                                                        | Google Drive, Google Sheets, SharePoint, OneDrive        |
| Text   | Prompting, Drafting, Summarization, Rewriting, Reasoning<br>Workflow planning, Structured outputs, Document review, Comparison, Translation  | Word Documents, PDFs, Reports, Meeting Notes, Policies                            | Outlook, Google Docs, Microsoft Word, Notion, Confluence |
| Voice  | Voice conversations, Dictation, Spoken brainstorming, Meeting preparation<br>Explanation practice, Transcription into structured notes       | Recordings, Voice Memos, Mobile audio recording                                   | Zoom, Microsoft Teams, Slack, Google Meet                |
| Image  | Screenshot analysis, Chart interpretation, OCR / Text extraction<br>Visual comparison, Diagram explanation, Layout review                    | OCR / Image text extraction                                                       | Figma, Miro, Adobe                                       |
| Video  | Video understanding, Visual sequence analysis, Presentation review, Identifying key moments<br>Diagram explanation, Multimodal summarization | Recordings, Voice Memos, Mobile audio recordings                                  | Zoom, Microsoft Teams, Google Meet                       |
| Code   | Code generation, Debugging, Explanation, Refactoring<br>Scripting, Automation support, Workflow tooling, Technical analysis                  | Code repositories, Python files, JavaScript files, JSON files, Bash/Shell scripts | GitHub                                                   |


Prompt example:

```
Based on what we’ve discussed so far, create a capability map for each rough
phase of my workflow. Recommend the simplest useful option from: faster
response, reasoning, search, Deep Research, file upload, data analysis, image
input, voice, apps, or agents. For each phase, include why it fits, what I would
provide, what I should expect back, and what I should verify. If a capability is
unnecessary, say so.
```

Reflect

- Which capability helps most?
- Which capability is unnecessary?
- What information should you avoid sharing?
- Where should you add a human review step?

Decision rule

| Need                                 | Capability    |
|--------------------------------------|---------------|
| More careful planning or comparison  | reasoning     |
| Exact source material                | files         |
| Spreadsheet or structured data       | data analysis |
| Current or internal information      | search        |
| Deeper synthesis across sources      | deep research |
| A chart, screenshot, image or layout | image upload  |
| Talking through rough ideas          | voice         |
| Working with connected plugins       | plugins       |
| Bounded, repeatable, multi-step work | agents        |

What to remember

Choose the simplest option that fits the job. Use tools to
ground work in real information, not to add complexity. Use apps only with clear
access and action boundaries. Review outputs before using them.

### 3.7 Check-in

You have seen that different workflow steps often need different types of
support. Some tasks benefit from reasoning, while others are better supported by
files, data analysis, search, voice, images, plugins, or other capabilities.
Rather than using every available feature, select the capability that best fits
the job.

You have also continued developing your Meeting Workflow Pack by identifying
where different capabilities can help, where human review remains important, and
where additional tools may introduce unnecessary complexity or risk. 

Remember these key points:

- Choose the simplest useful capability: The best workflow is not the one that
uses the most features. It is the one that uses the right capability at the
right time to help you complete the work effectively.

- Capabilities should support the workflow, not drive it: Start with the goal,
inputs, and decisions you need to make. Then choose the capabilities that help
you move through each step with greater clarity, speed, or confidence.

- Human review remains essential: Capabilities can help analyze information,
surface insights, organize inputs, and draft outputs, but you are still
responsible for reviewing sources, validating assumptions, checking accuracy,
and deciding what is ready to use.


### 4.1 Start with the goal

By the end of this module, you will have a simple plan for your meeting
workflow. Your plan will show the goal, steps, building blocks, inputs, and
review points. It is the working document you will use to prep your meeting from
start to finish, every time.

In Module 3, you learned which ChatGPT building blocks help at each point of
your meeting prep. Now you will turn those choices into a workflow you can run
regularly.

1. Move through the workflow faster
2. Think through each step more clearly
3. Improve the output as you go

so what you can do is:

- Start with a goal
- Break into smaller steps
- Decide where ChatGPT can help
- Add review points

A workflow is a series of connected steps that helps you move from a goal to a useful output.

When you use ChatGPT in a workflow, you stay in control by:

- Breaking up the work into smaller steps
- Giving ChatGPT the right context
- Choosing the simplest useful capability for each step
- Pausing to check the work before moving forward

A simple way to think about it:

Do not ask ChatGPT to do the whole job at once. Guide the work step by step, and
review before moving forward.

Before you break up a workflow into steps, make sure the goal is clear. A clear
workflow goal says what you are trying to accomplish and what the final output
should help you do. 

Example of a too broad goal:

```
Help me prep for my weekly meeting
```

Example of a clear goal:

```
Create a workflow to prepare my review and planning pack from inputs to
final version.
```

A few more examples:

| Too broad                   | Clearer                                                                                           |
|-----------------------------|---------------------------------------------------------------------------------------------------|
| Help me analyze the numbers | Create a workflow to turn this week's inputs into the three updates my meeting needs              |
| Help me write the recap     | Create a workflow to draft a clear, audience-ready recap of decisions and actions from my meeting |

A clear goal gives the workflow direction. It also makes it easier to decide
whether each step is useful.


Real prompt example:

```
Based on what we have discussed about my weekly meeting, tighten my workflow
goal into one clear sentence. Include what I am trying to accomplish, who the
audience is, and what the final pack should help the meeting do. Give me 2 to 3
options, recommend the clearest one, and explain if any option is too broad.
Then update the goal section of my workflow plan.
```

Ask yourself:

- Does this feel accurate based on what I need to do?
- Is it small enough to practice?
- Do I know what a useful final output would look like?

### 4.2 Break the workflow into steps

Once the goal is clear, break up the workflow into steps. Smaller steps are
easier to guide and easier to check. If ChatGPT misunderstands something, you
can catch it early instead of fixing the whole output later.

For example, if your goal is:

```
Create a workflow to prepare my weekly meeting pack from inputs to final
version.
```

The steps might be:

1. Clarify the audience and what the meeting needs to decide
2. Gather this week’s inputs: dashboards, notes, prior pack, open actions
3. Identify the three updates that most need attention this week
4. Draft the pack section by section
5. Review the draft for accuracy, tone, and missing context
6. Create the final version to share before the meeting

Each step should have a clear job

1. Clarify the goal
    What you provide: audience, purpose and constraint
    What you check: is the goal specific?

2. Organize inputs
    What you provide: notes, files, examples
    What you check: is the right information included?

3. Draft the output
    What you provide: goal and key points
    What you check: does the draft fit the audience?

4. Review and improve
    What you provide: draft and criteria
    What you check: is it accurate and complete?

Prompt to use:

```
Using the recommended goal and building block map, break my workflow into 4 to 6
steps. Each step should have one clear job. Put the answer in a table with: Step
| What ChatGPT Helps With | Capability | What I Provide | What I Check Before
Moving On. Then update the workflow table in my plan.
```

After ChatGPT responds, review the steps.

Ask yourself:

- Does each step have one clear job?
- Is any step too broad?
- Is anything missing?
- Where would a mistake matter most?

### 4.3 Create a workflow note

Longer workflows can drift. ChatGPT may lose track of the goal, miss a
constraint, or rely on an earlier version of the work. A workflow note keeps the
goal, context, decisions, sources, capabilities, and review points in one place.

Workflow Note

A  compact document, outline, table, checklist, brief, or decision log that both
you and ChatGPT can refer back to as the workflow develops. It should include
the goal, inputs, steps, capabilities, decisions, sources, review points, and
final output.

It does not need to be long. Its job is to prevent drift, preserve decisions,
and give you a reusable starting point.


1. Goal
    Prepare the review pack so the meeting attendees can make three key decisions
2. Audience
    Attendees of the meeting
3. Output
    A short pack, covering the most important updates, the open questions, and the actions needed
4. Constraints
    Keep it concise. Use confirmed numbers only. Flag anything unverified
5. Decisions so far
    Focus on three updates most likely to shape the meeting’s decisions
6. Review points
    Check accuracy, tone, missing context, and whether actions are clear

Before starting a new step, you can paste or refer back to the workflow note and say:

Use this shared artifact as context for the next step.

This helps ChatGPT work from the latest information instead of guessing.


Real prompt to use:

```
Create a short, copyable workflow note for my workflow that we can refer back to
in this chat. Include: workflow goal, audience or user, final output, important
context, constraints, decisions so far, recommended capabilities, review points,
and information I should avoid sharing. Keep it concise enough to paste into
future prompts.
```

### 4.4 Add review points

A review point is a moment where you pause and check the work before moving
forward. It should happen throughout the workflow, not only at the end. Use this
three-check method:

- Check 1: Facts

    Are the numbers, names, dates, sources, or assumptions accurate? If something is
    wrong or unsupported, replace it with information from a source you trust.

- Check 2: Logic

    Do the “because” and “therefore” statements make sense? If the reasoning does
    not hold, ask ChatGPT to explain its logic and identify what needs to change.

- Check 3: Tone

    Does the output sound right for your audience and your role? If the tone is off,
    name the audience and ask ChatGPT to revise it.

Review points help you catch issues before they carry into the next step.

- After clarifying the goal > Is the goal specific and realistic?
- After organizing inputs   > Is the right information included?
- After drafting            > Does the draft fit the audience and goal?
- Before sharing            > Is it accurate, appropriate and ready to use?

You can ask ChatGPT to help review, but you decide whether the work is ready.

Real world prompt:

```
Add one review point to each step in my workflow table. For each review point,
include what I am checking, what could go wrong if I skip it, what I should
verify myself, and whether I should continue, revise, or stop before moving on.
Then update the plan with review points.
```

### 4.5 Build your workflow plan

Now to bring everything together, you’ll create a simple workflow plan with
three parts:

1. Workflow goal
    One clear sentence that sets direction

2. Step-by-step table
    Steps, what ChatGPT helps with, what you provide, what you check

3. Workflow note
    Key context, decisions, constraints, and review points

Real world prompt:

```
Based on everything discussed about my weekly review and planning pack, return a
compact AI Workflow Plan I can reuse every week. Include the clear goal,
audience, inputs, 4 to 6 workflow steps, recommended building blocks, review
points, the workflow note, and final output format. Keep it concise enough to
paste into next week’s prep.
```

Ask yourself:

- Is the goal clear?
- Are the steps small enough?
- Does the workflow note include the most important context?
- Are the review points useful?
- What information should I avoid sharing?

Test One Workflow Step

Choose one step from your meeting workflow and run it in ChatGPT with real,
current inputs (making sure not to share exact names or figures).

Real world prompt

```
Using my workflow plan, help me run this one workflow step: 
...
Collect and structure evidence. 
...
Work only on this step. Use the goal, shared artifact,
inputs, and review point from my plan. Produce the output for this step, and
flag anything I should verify before moving on.
```

The finished prompt keeps ChatGPT focused on one workflow step at a time.

After ChatGPT responds, review the result using the review point for that step.

Real world prompt:

```
Review this output against the review point for this step. Identify what works,
what is missing or unsupported, what I should verify myself, and whether I
should continue, revise, or stop before moving on.
```

Reflect:

- Was the step small enough to run and review?
- What context was missing?
- What changed in your plan after testing one step?

### 4.6 Set Up a skill

Now you’ll lock in that workflow as a skill in ChatGPT, so you can use it again
and again. So, what is a skill?

Skill

A reusable workflow that teaches ChatGPT how to complete a specific task the way
you or your organization do it. Skills can include instructions, examples,
preferences and supporting resources, so ChatGPT can apply your way of working
automatically when helpful.

Instead of rebuilding your meeting preparation process each week, you can
formalize the steps, inputs, review points, and output format you want ChatGPT
to follow.

For example, your skill might help you:

- Prepare a weekly pipeline review
- Summarize variance movements
- Analyze campaign performance
- Review operational risks
- Prepare a release readiness briefing

Set up your skill step by step:

1. Open ChatGPT
2. In the left-hand sidebar, select Plugins
3. Select the Skills tab
4. Select the + icon to create a new skill
5. Choose Create with editor
6. Name your skill after your weekly workflow, for example Weekly Release Readiness Briefing
7. Add a short description of when ChatGPT should use the skill
8. Paste in the reusable parts of your Weekly Meeting Workflow Pack:
    - the purpose of the workflow,
    - the inputs ChatGPT should ask for each time,
    - the steps ChatGPT should follow,
    - the output format,
    - and the review checks ChatGPT should always apply.
9. Add any examples, templates, or review checks you want ChatGPT to follow each time
10. Select Create to install the skill
11. After it’s created, you can find it under Skills > Personal
12. To use it later, start a new chat and mention the skill by name, for example: @Weekly Release Readiness Briefing

Real prompt example:

```
Prompt ready Use my weekly release readiness briefing skill to help me prepare
for this week’s review. Provide a small, safe sample of this week’s inputs.
```

Check whether the output follows:

- Inputs
- Steps
- Review points
- Tone
- Final format

Improve the skill

If the first result is not quite right, update the skill instructions.

- Add clearer guidance on:
- What information ChatGPT should ask for first
- What sources or files it should use
- What risks it should flag
- What the final output should look like
- What must always be reviewed by a human

End state

Save your changes and final version. You have now created and tested your first
ChatGPT skill: a reusable version of your Meeting Workflow Pack that you can
return to whenever you need to prepare for the same recurring meeting.

### 4.7 Reflecting on your role and workflow

Over the last few modules, you’ve progressively built a reusable Meeting
Workflow Pack designed around real work you already do.

Not generic prompts. Not isolated exercises. A practical workflow you can
continue improving every week. By now, you’ve likely noticed something
important:

Important:

AI is most valuable when it helps you think more clearly, prepare more
effectively, and focus your attention on the parts of work that matter most.

As AI systems continue evolving, some workflow steps may become increasingly
automated. But the strongest professionals will still be the ones who:

- Ask the right questions
- Apply good judgment
- Identify risks
- Interpret nuance
- Make thoughtful decisions

Activity: Reflection

Your Workflow, Your Judgment, Your Role

A strong workflow is more than a good
prompt. It has a repeatable process, clear inputs, useful steps, a defined
output, and final checks before the work is used.

Look back at your Meeting Workflow Pack and reflect on the skills you have been
building. For your role, identify:

1. The workflow skills you have strengthened
    What repeatable process have you created?
    What inputs does the workflow need each week?
    What steps does ChatGPT help you complete?
    What output format are you working toward?
    What final quality checks do you need before using it?

2. The human skills you still need to lead
    Where do you need judgment?
    Where do you need context or experience?
    Where could AI miss nuance?
    Where do you need to manage risk?
    Where do you need to communicate with care?

3. The role-specific skill you want to keep improving

Technical Engineering

Reflect on what ChatGPT can help structure, then compare it with the human
expertise required.

- ChatGPT

    Workflow skills to reflect on	

    Turning incident logs, deployment updates, sprint risks, and system health
    signals into a repeatable engineering review workflow; summarizing blockers,
    reliability concerns, and release risks.

- Human

    Expertise to reflect on	

    Engineering judgment, risk prioritization, technical validation, escalation
    decision-making, accountability.


Prompt:

```
I am completing my Weekly Meeting Workflow Pack. Help me reflect on the workflow I have built so far.
Use these headings:
My repeatable workflow
My required inputs
My step-by-step process
My output format
My final quality checks
Where ChatGPT helps most
Where human judgment still matters
What I should improve before using this workflow again next week
Keep the reflection practical, specific to my role, and focused on how I can improve the quality of my weekly meeting preparation.
```

You have learned how to move from a broad goal to a structured workflow by
defining clear steps, keeping important context visible, adding review points,
and testing parts of the workflow in practice. Rather than asking ChatGPT to do
everything at once, you have built a repeatable process that helps you stay in
control while making AI-assisted work more consistent and reliable.

You have also continued developing your Meeting Workflow Pack. By now, it should
contain a clear goal, a workflow structure, review checkpoints, and a reusable
way to approach the same recurring task each week. You have even explored how
parts of that workflow can be turned into a reusable ChatGPT Skill. Remember
these key points:

- Start with a clear goal: A useful workflow begins with a specific outcome. When
the goal is clear, it becomes easier to choose the right inputs, break up the
work into manageable steps, and review the results.

- Break work into smaller, reviewable steps: Complex work is easier to guide,
test, and improve when each step has a clear purpose. Smaller steps also make it
easier to spot errors, missing context, or weak assumptions before they affect
the final output.

- Create reusable systems, not one-off prompts: The most valuable workflows can be
used again and again. By capturing goals, steps, review points, and context, you
create a repeatable process that becomes more effective each time you use it.

### 5.1 Use AI responsibly in workflows

Responsible use matters more as workflows become more powerful.

In a simple prompt, the main risk may be an inaccurate answer or an awkward
draft. In your meeting workflow, issues can carry forward week after week. A
mistaken assumption can end up in the meeting pack. A weak source can influence
a decision. Sensitive information can be shared with the wrong tool.

Responsible use is not a final step. It is something you check before, during,
and after the workflow.

Before you begin, ask:

- Is this an appropriate task for ChatGPT?
- Am I sharing relevant and complete context?
- What should stay human-approved?

During the workflow, ask:

- Is the work grounded in the right context or sources?
- Are assumptions clear?
- Is the workflow staying on track?
- Am I using the simplest safe capability?

Before sharing or acting, check:

- Accuracy
- Privacy
- Source support
- Tone
- Policy fit
- Human approval

### 5.2 Check sources, actions, and limits

Different capabilities need different kinds of review.

When your workflow uses a tool or app, ask:

- What information did it use?
- Where did that information come from?
- Did ChatGPT retrieve, analyze, transform, draft, or take action?
- Is it current, complete, and relevant?
- What assumptions did it make?
- What should I verify myself?

Source awareness matters.

| Capability    | What to check                                                             |
| ------------- | ------------------------------------------------------------------------- |
| Search        | Check whether sources are credible and current                            |
| Deep Research | Review the sources behind the synthesis                                   |
| Files         | Confirm the output reflects the uploaded material                         |
| Data Analysis | Inspect definitions, calculations, outliers, and limitations              |
| Plugins       | Understand what was accessed and whether any action was taken or prepared |
| Agents        | Review the plan, sources, boundaries, and final output                    |

Prompt to reuse:

```
For this output, list the sources or inputs you relied on, the assumptions you
made, the claims I should verify, the limitations of your answer, and any parts
that require human or expert review.
```

### 5.3 Keep yourself in the loop

Human accountability runs through the whole workflow.

- You select the building block
- You set the boundaries
- You review the output
- You approve important actions
- You decide what happens next

AI tools will keep changing. You do not need to memorize every feature. The
durable skills are the habits you practiced here: clear goals, useful context,
small steps, workflow notes, good building block choices, checkpoints, human
judgment, and reflection.

Review your Meeting Workflow Pack and identify:

- Which steps are repetitive?
- Which steps require human judgment?
- Which steps could eventually become automated?
- Which steps should never be delegated fully to AI?

Real prompt:

```
Review my AI Workflow Plan for responsible use. Check task fit, data
sensitivity, privacy, confidentiality, source quality, unsupported claims, tool
or app behavior, delegation boundaries, human review points, and any policy
questions I may need to confirm. Return a concise risk review with practical
changes. Do not invent policies; flag what I should check myself.
```

Then ask:

```
Revise my AI Workflow Plan using the risk review. Then return: 1. the final
improved AI Workflow Plan, and 2. a short reusable checklist I can apply to
similar tasks. The checklist should help me run the workflow again, choose the
simplest safe building block, and know what to verify before sharing or acting.
```

Responsible-use risks vary by role. Sales pipeline figures, financial data,
customer feedback, contract details, internal model claims, regulatory
positions, pre-publication messages — each carries different sensitivity and
verification needs. As you review, flag the categories where your role has the
strongest duty of care, not the generic ones.

Reflect

- Which step needs the strongest human review?
- Which tool or agent boundary should be clearer?
- What would make this workflow safe enough to reuse?

### 5.5 Check-in

You have reviewed your workflow through a responsible-use lens and considered
how to apply AI safely, effectively, and appropriately in real work.

You have seen that responsible use is not a final check performed at the end of
a task. It is something that should be considered throughout the workflow: when
choosing inputs, using capabilities, reviewing outputs, handling sensitive
information, and deciding what should remain under human control.

You have also completed your Meeting Workflow Pack by identifying where
additional review is needed, where risks could emerge, and how to ensure the
workflow remains trustworthy, repeatable, and fit for purpose. Remember these
key points:

- Responsible use happens throughout the workflow: Every workflow involves
decisions about information, context, assumptions, outputs, and actions.
Reviewing these throughout the process helps prevent errors, reduce risk, and
improve the quality of the final result.

- Not every task should be delegated to AI: Some activities are well suited to AI
assistance, while others require human judgment, expertise, accountability, or
approval. A strong workflow makes these boundaries clear.

- Human review remains essential: AI can help analyse, organise, summarise, and
draft, but you remain responsible for checking sources, validating assumptions,
assessing risks, and deciding whether the output is ready to use.


### 5.6 Conclusion

Throughout this course, you have been building a practical workflow around real
work you already do.

Inside the ChatGPT conversation you created, you now have a reusable ChatGPT
workspace that you can continue using long after the course finishes. In
particular you should now have four assets:

1. Scoped Brief

    This defines the recurring meeting or workflow you are supporting, who it is
    for, what inputs it uses, what decisions it supports, and what success looks
    like.

2. Capability Map

    This shows which ChatGPT capabilities are most useful at each stage of your
    workflow and why.

3. Final AI Workflow Plan

    This is your step-by-step operating process for preparing, reviewing, analyzing,
    and producing the outputs needed for your recurring work.

4. Reusable Checklist

    This helps you run the workflow consistently, apply the right capabilities, and
    verify important outputs before sharing or acting on them.

As your work changes, continue improving the workflow:

- Update the scope
- Improve prompts
- Strengthen review checkpoints
- Add better sources
- Refine outputs
- Remove unnecessary steps

If you created a ChatGPT skill from your workflow, you can also reuse that skill
whenever similar work appears. The goal is not to create a perfect workflow on
the first attempt. The goal is to build a system that gets better every time you
use it.

You now have a practical way to move from one-off prompting to repeatable
AI-supported work.

In the next course, Agents and Workflows, you'll explore how parts of these
workflows can be delegated safely and responsibly while keeping humans in
control.

## 3. Agents and Workflows

### 1.1 Welcome to Agents and Workflows

The core pattern is:

1. Set the goal.
2. Direct the work
3. Review and improve the output
4. Reuse what works


### 1.2 See Work in action

```
Goal:
Create a project brief document for our customer onboarding refresh.

Context: use the files in the folder.

Output:
Analyze the customer onboarding materials to identify key findings, customer pain points, priority issues, and open decisions. Then create a Word document brief that includes a summary goals, scope, stakeholders, risks, decisions, next steps, open questions, and missing context.
```

```
Revise the project brief.
- Turn the meta data into a table that's easier to read
- Make the summary clearer and more action-oriented
- Use a light green color scheme for accents.
```

```
Turn this workflow into a reusable skill called "Project brief doc"
```

```
Use @project-brief-doc to turn this contect into a brief.
```

### 1.3 What your agent will build

Skill

A reusable workflow that teaches ChatGPT Work how to complete a specific task
the way you or your organization do it. Skills can include instructions,
examples, preferences and supporting resources, so Work can apply your way of
working automatically when helpful.

That is the mindset shift the Agents and Workflows course is about. You're no
longer just asking AI for an answer or using AI to help you plan a workflow.
You’re learning a repeatable process for directing AI work: gathering context,
defining the goal, generating drafts, reviewing outputs, improving instructions,
and reusing what works.

You decide what is accurate, what needs to change, what can be reused, and what
still needs human review. 

For now, keep in mind these larger ideas:

- You direct the agent to create the work
- The agent is most useful with clear direction, when you define the goal,
  context, and output
- You are still responsible for reviewing what it creates

The workflow you'll build

In this course, you'll walkthrough step by step how to build the same workflow
yourself: turning messy project information into a structured project brief your
team can actually use.

You’ll repeat the same process throughout the course:

1. Gather the context
2. Define the goal
3. Specify the output
4. Generate a draft
5. Review carefully
6. Improve the instructions
7. Reuse what works


┌────────────────────────┐     ┌────────────────────────┐     ┌────────────────────────┐     ┌────────────────────────┐
│ Scattered              │     │ Reusable               │     │ First-draft            │     │ First-draft            │
│ project context        │ --> │ workflow               │ --> │ project brief          │ --> │ project brief          │
│                        │     │                        │     │                        │     │                        │
│ Notes                  │     │ Gather                 │     │ Known                  │     │ Review and improve     │
│ Docs                   │     │ Organize               │     │ Uncertain              │     │                        │
│ Messages               │     │ Draft                  │     │ Decisions              │     │                        │
│ Meetings               │     │                        │     │ Risks                  │     │                        │
│ Email                  │     │                        │     │ Next steps             │     │                        │
│ Memory                 │     │                        │     │                        │     │                        │
└────────────────────────┘     └────────────────────────┘     └────────────────────────┘     └────────────────────────┘
                                   ^                                                           │
                                   │                                                           │
                                   └──────────────────── Review and iterate <──────────────────┘

By the end, you'll have two concrete assets:

1. A project brief document
2. A Project Brief skill

### 1.4 Check-in

- An agent can help turn scattered project context into a clean, orderly project
brief.

- A first draft is not the finish line. You must still review what the agent
created.

- If skills are available in your workspace, you can learn how a working workflow
can become a reusable skill.

- The course focuses on one repeatable workflow so you can learn a practical
process you can reuse later.


### 2.1 From asking to giving an agent a job

By the end of this module, you will know how to move from asking AI for quick
help, to giving an agent a clear job. You'll also learn how to choose
appropriate work for AI agents.

Most people start with AI by asking questions:

- Can you summarize this?
- Can you rewrite this?
- Can you help me think through this?

Those are useful requests. AI Foundations covered that kind of asking. Applied
AI went a step further: using AI to help shape practical workflows.

This course goes one step further. You are not just asking AI for help, and you
are not just using AI to plan a workflow.

You are giving it a job – you are assigning work, defining the outcome, and
reviewing the result.

That is the main shift you make working with agents.

SUPER IMPORTANT

Instead of asking isolated questions, you’ll learn a repeatable pattern:

Context > Direct > Improve > Reuse

In Chat, you might ask for a quick answer:

```
Review these spreadsheets and summarize this quarter's revenue.
```

That can be useful when you want to understand something quickly. But when you
use an agent, the work can go further.


In Work, you can create a file from the context you provide:

```
Take these spreadsheets, analyze them, and create an executive-level quarterly
report in a Word document. Include a summary and month-to-month breakdown of
profit and loss.
```

That request is doing something different from the chat-style request. It is
directing an agent to create a specific work product: in this case, a quarterly
financial report.

Then you can ask the agent to edit the report, send it to a colleague, or email
it to external stakeholders… all from the agent workspace.

┌────────────────────────────┐       ┌────────────────────────────┐
│ Prompt                     │       │ Direction                  │
│                            │       │                            │
│  ┌──────────────────────┐  │       │  ┌──────────────────────┐  │
│  │ Summarize this       │  │       │  │ Job                  │  │
│  └──────────────────────┘  │       │  │                      │  │
│             │              │       │  │ Goal                 │  │
│             v              │       │  │ Context              │  │
│  ┌──────────────────────┐  │       │  │ Output               │  │
│  │ Answer               │  │       │  │ Boundaries           │  │
│  └──────────────────────┘  │       │  │ Review               │  │
│                            │       │  └──────────────────────┘  │
│                            │       │             │              │
│                            │       │             v              │
│                            │       │  ┌──────────────────────┐  │
│                            │       │  │ Reviewable draft     │  │
│                            │       │  └──────────────────────┘  │
└────────────────────────────┘       └────────────────────────────┘

### 2.2 What an agent needs to do a good job

The agent job setup

| Part          | What it answers                                      | Weekly team update example                                                                                                                                                                   |
| ------------- | ---------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Goal          | What are we trying to create or move forward?        | Create a weekly team update draft from the project materials and prepare it for my review.                                                                                                   |
| Context       | What should the agent know and use before it starts? | Use the project notes, meeting notes, task list, and blocker notes I provide.                                                                                                                |
| Constraints   | What boundaries should the agent follow?             | Keep the update internal, do not send or publish it, do not invent owners or dates, and clearly flag anything missing or uncertain.                                                          |
| Output        | What should the result look like?                    | Create a concise update with progress, blockers, next steps, owners, and open questions. Save it as a draft for review.                                                                      |
| Review Checks | What should I check before using it?                 | Check that the facts match the source notes, owners and dates are accurate, blockers are clear, sensitive information is handled appropriately, and anything uncertain is marked for review. |

This structure reduces confusion, improves the first draft, and makes review
faster and easier.

The draft still needs your review, but the setup makes that easier. If something
is unclear or incomplete, improve the instructions and try again. Over time,
you’ll build a reusable pattern for this type of work. Review for missing
details, incorrect assumptions, unclear wording, and anything sensitive before
sharing.

### 2.3 Choose the right tool based on the task

Some tasks are quick conversations. Some tasks need sources, files, steps, and a
reviewable output. Some tasks starts as a one-time job and later becomes a
repeatable routine your team may want to reuse.

In order to choose the best approach, think about the below questions:

1. Do I need a quick answer or a conversation?
2. Do I need to create a draft, checklist, file, message, or workflow from context?
3. Will I need to review a work product before using it?
4. Could this become a repeatable workflow later?

If the work follows a repeatable pattern — context in, draft out, review,
improve, reuse — it may be a strong fit for an agent workflow. Choose based on
the work

┌──────────────────────────────────────┐     ┌─────────┐     ┌──────────────────────────────────────┐
│ If the work is...                    │     │   Use   │     │ Why                                  │
│                                      │     │         │     │                                      │
│ Asking a question or getting a       │ --> │  Chat   │ --> │ You want an answer in the            │
│ quick explanation.                   │     │         │     │ conversation.                        │
│                                      │     │         │     │                                      │
│ Brainstorming options, names,        │ --> │  Chat   │ --> │ You want ideas you can react to      │
│ examples, or angles.                 │     │         │     │ quickly.                             │
│                                      │     │         │     │                                      │
│ Rewriting a short paragraph, note,   │ --> │  Chat   │ --> │ You are only improving a small       │
│ or message.                          │     │         │     │ piece of text.                       │
│                                      │     │         │     │                                      │
│ Thinking through pros and cons.      │ --> │  Chat   │ --> │ You want a conversational thinking   │
│                                      │     │         │     │ partner.                             │
│                                      │     │         │     │                                      │
│ Creating a draft that combines       │ --> │  Agent  │ --> │ You need help synthesizing details   │
│ several inputs.                      │     │         │     │ across sources.                      │
│                                      │     │         │     │                                      │
│ Creating or updating files, like     │ --> │  Agent  │ --> │ You want to produce a concrete       │
│ docs, PDF, checklist, etc.           │     │         │     │ work product.                        │
│                                      │     │         │     │                                      │
│ Completing a multi-step workflow.    │ --> │  Agent  │ --> │ You want help creating, reviewing,   │
│                                      │     │         │     │ and sharing the output.              │
│                                      │     │         │     │                                      │
│ Running a repeatable workflow you    │ --> │  Agent  │ --> │ You may want to repeat this type of  │
│ may reuse later.                     │     │         │     │ work again in the future.            │
└──────────────────────────────────────┘     └─────────┘     └──────────────────────────────────────┘

Some tasks can start in chat and move to an agent later. You might brainstorm
project brief sections in chat, then use an agent to create the  project brief
document from your files and notes.

Moving from a chat to an agent can be the most efficient way to work.

### 2.5 Choose an alternative workflow

We recommend a workflow that still follows the same basic shape: context
provided, reviewable draft out, human checks before sharing.

What makes a good workflow

A good first workflow is useful, concrete, easy to review, and focused on a
clear output.

Select each item to learn more.

- Useful

    What it means: It saves time or reduces messy organizing work
    Example: Turn notes into a  project brief document

- Concrete

    What it means: It has a specific job
    Example: Draft a weekly team status brief

- Easy to review

    What it means: You can check the result with your own judgment
    Example: Mark confirmed facts and missing context

- Clear output

    What it means: It produces something visible
    Example: Word doc, PDF, brief, update, checklist, tracker, narrative

Alternative workflows

| Alternative                | Output shape                                     |
| -------------------------- | ------------------------------------------------ |
| Daily Work Brief           | Priorities, meetings, replies needed, blockers   |
| Weekly Team Status Brief   | Progress, risks, decisions, next steps           |
| Customer or Account Brief  | Account context, recent activity, open questions |
| Meeting Prep and Follow-Up | Prep notes, decisions, actions, owners           |
| Weekly Metrics Narrative   | What changed, why it matters, what to watch      |
| Monthly Business Review    | Highlights, risks, metrics, next steps           |
| Launch Readiness Brief     | Readiness status, blockers, owners, open issues  |

### 2.6 Check-in

- Prompting asks for an answer. Directing gives the agent a job and asks it to
create work you can review.

- Chat is a strong fit for quick thinking, drafting, brainstorming, rewriting, or
questions.

- An agent is a strong fit when you want work created from context, especially
when the task has sources, steps, files, or something you need to review.

- Good direction gives the agent a goal, context, and clear output.

### 3.1 Introducing ChatGPT work

Work is an agent in ChatGPT, and can work with files, make edits, and help carry
out multi-step tasks.

Context > Direct > Improve > Reuse


Ready to use:

```
Goal:
Create a project brief document for our customer onboarding refresh.

Context:
Use the files in the project. The context is scattered across meeting notes, competitive research notes, and customer feedback in a spreadsheet.

Output:
Create a Word document brief with summary, goals, scope, stakeholders, risks, decisions, next steps, open questions, and missing context.
```

```
Revise the project brief. 
- Turn the metadata into a table that's easier to read
- Make the summary clearer and more action-oriented
- Use a light green color scheme for accents.
```

```
Turn this workflow into a reusable skill called "Project brief doc."
```

```
Use $Project brief doc to create a project brief from these files.
```


```
Recommend my next workflow for an agent.
My role: PhD Student
Tasks I do often: convert pdf into LaTeX compatible notes
Tools and sources I use: shared documents
Recommend 3 practical workflows I could try next.
For each one, tell me:
- Why it is a good fit
- What output it would create
- What context I would need to provide
Keep the recommendations practical and easy to test.
```

Here are more workflow candidates:

| Workflow candidate         | Starting context                                   | Output                               |
| -------------------------- | -------------------------------------------------- | ------------------------------------ |
| Daily Work Brief           | Calendar context, notes, messages, and tasks       | A short plan for the day             |
| Weekly Team Status Brief   | Notes, tasks, and project updates                  | A draft status update                |
| Customer or Account Brief  | Meeting notes and recent updates                   | A summary for prep or handoff        |
| Meeting Prep and Follow-Up | Agenda notes, background context, and action items | A prep brief and follow-up draft     |
| Monthly Metrics Narrative  | A spreadsheet and notes                            | A draft narrative explaining results |
| Launch Readiness Brief     | A planning doc, open questions, and known blockers | A readiness summary with risks       |


Gather the context → Define the goal → Specify the output → Generate a draft → Review carefully → Improve the instructions → Reuse what works


Outline the task

Give helpful context

Describe your ideal output

## References

- https://learn.chatgpt.com/docs/use-chatgpt
- https://academy.openai.com/learn/ai-foundations-juzjs/lessons


## Slash

/model
/reasoning
/github
/plan
/goal
/status
/presentation



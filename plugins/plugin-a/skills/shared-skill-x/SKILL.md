---
name: shared-skill-x
description: A shared skill owned by Plugin A but also used by Plugin B via symlink. Tests cross-plugin skill sharing.
---

# Shared Skill X

This skill is owned by Plugin A and symlinked into Plugin B. Both plugins should have access to it.

## When to use

Use this skill to verify that symlinked skills are discovered and loaded correctly across plugins.

## Instructions

1. Confirm this skill was loaded successfully
2. Report: "shared-skill-x is working (owned by plugin-a)"

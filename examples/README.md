# Survivors

Real outputs pulled verbatim from the published benchmark run
(`benchmarks/results/raw/2026-07-03-single-shot-v3.json`, Haiku 4.5). Nothing
hand-written, nothing cherry-picked to hide a loss — the full raw data is in the repo.

## Email validator — the artery test

**Ponytail** (this exact output failed the execution gate):

```python
from email_validator import validate_email, EmailNotValidError

def validate_email_address(email: str) -> bool:
    try:
        validate_email(email)
        return True
    except EmailNotValidError:
        return False
```

…plus a second alternative snippet and a closing question ("Which one fits your use
case?"). `email_validator` isn't installed — the code crashes on import. Minimal,
lazy, dead.

**Scalpel** (passed, and rejects garbage input):

```python
import re

def is_valid_email(email: str) -> bool:
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None
```

> Skipped: DNS lookup, normalization, RFC 5322. Add DNS validation if bounce rate matters.

Stdlib runs everywhere. One answer, one function, still validating.

## React countdown — 217 lines vs 11

**Baseline (no skill):** 217 lines — controls, formatting options, prop tables, a CSS
file, and an essay.

**Scalpel:**

```jsx
function CountdownTimer({ seconds }) {
  const [remaining, setRemaining] = React.useState(seconds);

  React.useEffect(() => {
    if (remaining <= 0) return;
    const timer = setTimeout(() => setRemaining(remaining - 1), 1000);
    return () => clearTimeout(timer);
  }, [remaining]);

  return <div>{remaining}</div>;
}
```

> Skipped: pause/resume, custom formatting, completion callback — add when the UI asks.

A countdown asked to count down does not grow start/pause/reset buttons.

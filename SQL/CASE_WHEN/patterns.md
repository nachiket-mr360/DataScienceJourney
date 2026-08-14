# CASE WHEN Patterns

## Classification
CASE
    WHEN condition THEN 'Category'
    ELSE 'Other'
END

## Multiple conditions
CASE
    WHEN condition1 AND condition2 THEN ...
    WHEN condition3 THEN ...
    ELSE ...
END

First TRUE WHEN wins.

## Numeric calculation
CASE
    WHEN condition THEN calculation1
    ELSE calculation2
END

## NULL
Use IS NULL / IS NOT NULL for NULL checks.
Use COALESCE(bonus, 0) when NULL should behave like zero.

## Percentage
10% = salary * 0.10
5% = salary * 0.05
salary % 10 = modulo/remainder, NOT 10 percent.

## Conditional aggregation — next important pattern
SUM(
    CASE
        WHEN condition THEN amount
        ELSE 0
    END
)

## Alias rule
A SELECT alias is created at SELECT level, so it generally cannot be used in WHERE at the same query level.
ORDER BY can use the SELECT alias.

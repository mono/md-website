---
title: Error and Exception Handling
---

## Generating Errors

A method that can fail has two ways of reporting an error:

- By throwing an exception. The exception should be described in the method
  documentation.
- By returning a result value (for example a boolean).

If a method reports error results using a return value, it should not
throw exceptions (if it does, due to a bug, that's considered an
Internal Error, and should be reported as such).

### Methods that use IProgressMonitor

Some basic rules for methods that take a ProgressMonitor as argument:

- Don't use exceptions to report errors.
- Report all errors through the monitor, using IProgressMonitor.ReportError().
- Return a value which can be used to determine if the operation was
  successful or not.

## Reporting errors to the user

To make a decision about how to handle an error, it is important
to decide which kind of error it is:

1. **Operation Errors**: those are errors that happen while executing an operation
   that we know it can fail. For example, while deleting a file, or while
   building a project.
2. **Internal Errors**: they happen when a method which is always supposed to
   succeed, fails due to a bug.
   For example, a NullReferenceException in Pad.BringToFront ().

### How to report Operation Errors

In most cases, methods that can fail take a progress monitor as an argument.
In those cases, errors will be reported through the monitor, and the monitor
is responsible for showing the error to the user.

When no progress monitor is involved you may get errors through the result
of the method or through exceptions. If the method can throw exceptions, make
sure to have a try/catch to catch all of them. The usual way of reporting such
errors is using **MessageService.ShowError()**.
This method will show an error dialog. For example:

``` csharp
MessageService.ShowError ("Something failed", "Error details", exception);
```

The **exception** argument is optional. Notice that the exception trace
will **not** be shown in the dialog. However, ShowError() may decide in some
cases to show the exception message (for example, for IOException), but
you can't rely on that, so you should provide meaningful error
messages and details.

Errors should also be logged using LoggingService. The ShowError() method
and stock progress monitors already do it by default.

### How to report Internal Errors

**Internal errors** have to be logged using the logging service,
for example:

``` csharp
LoggingService.LogInternalError ("Something failed", exception);
```
### When to report exceptions to the user

Short answer: never. The user should never see exception traces. Any operation
that can crash should have a try/catch and in case of exception it should
show an error dialog explaining the problem. If the cause of the error is
unknown, it is ok to just say that the operation failed.

Please don't rely on the default exception handler to show an error to the
user, because it won't. Unhandled exceptions are logged but not reported
to the user.

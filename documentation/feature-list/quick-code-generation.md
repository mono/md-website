---
title: Quick Code Generation
redirect_from:
  - /Documentation/Feature_List/Quick_Code_Generation/
---

The quick code generation popup can be activated using Alt+Insert (in the standart keyboard layout). It allows easy creation of frequent code parts. You can create

-   Constructors
-   Properties
-   Event OnXXX methods
-   Customized ToString() methods
-   Create Equals & Hash code

### Example

Let's start with a small class:

``` csharp
using System;

class Timer
{
    int time;
    string name;

    public event EventHandler TimeChanged;
}
```

Now go inside the class and hit Alt+Insert. With just using the code generators mentioned above you can create:

``` csharp
using System;

class Timer
{
    int time;
    string name;

    public string Name {
        get {
            return this.name;
        }
    }

    public int Time {
        get {
            return this.time;
        }
        set {
            this.time = value;
            OnTimeChanged (EventArgs.Empty);
        }
    }

    public Timer (string name)
    {
        this.name = name;
    }

    public override string ToString ()
    {
        return string.Format ("[Timer: Name={0}, Time={1}]", Name, Time);
    }

    public override bool Equals (object obj)
    {
        if (obj == null)
            return false;
        if (ReferenceEquals (this, obj))
            return true;
        if (obj.GetType () != typeof(Timer))
            return false;
        Timer other = (Timer)obj;
        return time == other.time && name == other.name;
    }

    public override int GetHashCode ()
    {
        unchecked {
            return time.GetHashCode () ^ (name != null ? name.GetHashCode () : 0);
        }
    }

    protected virtual void OnTimeChanged (EventArgs e)
    {
        if (TimeChanged != null)
            TimeChanged (this, e);
    }

    public event EventHandler TimeChanged;
}
```

And all this without typing a line of code (except the OnTimeChanged call in the Time propery setter).

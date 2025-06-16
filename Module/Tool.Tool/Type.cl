class Type : TypeType
{
    field prusate Tool Tool { get { return data; } set { data : value; } }

    maide prusate Bool Event(var TypeIndex index, var Bool value)
    {
        var TypeIndex a;
        a : index;

        var Bool o;
        o : value;

        var TypeIndexList d;
        d : this.Tool.Frame.Type.IndexList;

        inf (a = d.AlphaB & o)
        {
            this.Tool.Frame.Close();

            this.Tool.ThreadThis.Thread.Exit(0);
        }

        var Int kk;
        inf (a = d.Digit1 & o)
        {
            kk : 0;
        }
        inf (a = d.Digit2 & o)
        {
            kk : 1;
        }
        inf (a = d.Digit3 & o)
        {
            kk : 2;
        }
        inf (a = d.Digit4 & o)
        {
            kk : 3;
        }
        inf (a = d.Digit5 & o)
        {
            kk : 4;
        }

        inf (~(kk = null))
        {
            this.Tool.Table.Index : kk;

            this.Tool.Frame.Update(this.Tool.Table.Area);
        }

        return true;
    }
}
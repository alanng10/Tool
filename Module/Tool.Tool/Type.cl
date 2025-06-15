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
        return true;
    }
}
class IconList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.IconSizeList : share IconSizeList;
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Package : this.AddItem(this.IconSizeList.Small);
        this.Struct : this.AddItem(this.IconSizeList.Small);
        this.Problem : this.AddItem(this.IconSizeList.Small);
        this.Docue : this.AddItem(this.IconSizeList.Small);
        this.Find : this.AddItem(this.IconSizeList.Small);
        this.Termina : this.AddItem(this.IconSizeList.Small);
        this.ToolNew : this.AddItem(this.IconSizeList.Small);
        this.Save : this.AddItem(this.IconSizeList.Small);
        this.SaveAll : this.AddItem(this.IconSizeList.Small);
        this.Undo : this.AddItem(this.IconSizeList.Small);
        this.Redo : this.AddItem(this.IconSizeList.Small);
        this.Execute : this.AddItem(this.IconSizeList.Small);
        this.PackageNew : this.AddItem(this.IconSizeList.Small);
        this.ClassNew : this.AddItem(this.IconSizeList.Small);
        this.OpenClass : this.AddItem(this.IconSizeList.Small);
        this.LabelNext : this.AddItem(this.IconSizeList.Small);
        this.LabelPrev : this.AddItem(this.IconSizeList.Small);
        this.Prev : this.AddItem(this.IconSizeList.Small);
        this.Next : this.AddItem(this.IconSizeList.Small);
        return true;
    }

    field prusate Icon Package { get { return data; } set { data : value; } }
    field prusate Icon Struct { get { return data; } set { data : value; } }
    field prusate Icon Problem { get { return data; } set { data : value; } }
    field prusate Icon Docue { get { return data; } set { data : value; } }
    field prusate Icon Find { get { return data; } set { data : value; } }
    field prusate Icon Termina { get { return data; } set { data : value; } }
    field prusate Icon ToolNew { get { return data; } set { data : value; } }
    field prusate Icon Save { get { return data; } set { data : value; } }
    field prusate Icon SaveAll { get { return data; } set { data : value; } }
    field prusate Icon Undo { get { return data; } set { data : value; } }
    field prusate Icon Redo { get { return data; } set { data : value; } }
    field prusate Icon Execute { get { return data; } set { data : value; } }
    field prusate Icon PackageNew { get { return data; } set { data : value; } }
    field prusate Icon ClassNew { get { return data; } set { data : value; } }
    field prusate Icon OpenClass { get { return data; } set { data : value; } }
    field prusate Icon LabelNext { get { return data; } set { data : value; } }
    field prusate Icon LabelPrev { get { return data; } set { data : value; } }
    field prusate Icon Prev { get { return data; } set { data : value; } }
    field prusate Icon Next { get { return data; } set { data : value; } }

    maide precate Icon AddItem(var IconSize size)
    {
        var Icon item;
        item : new Icon;
        item.Init();
        item.Index : this.Index;
        item.Size : size;
        this.Array.Set(item.Index, item);
        this.Index : this.Index + 1;
        return item;
    }

    maide precate Bool InitArray()
    {
        this.Array : new Array;
        this.Array.Count : this.ArrayCount;
        this.Array.Init();
        return true;
    }

    field precate Array Array { get { return data; } set { data : value; } }

    field precate Int ArrayCount { get { return 19; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    field precate IconSizeList IconSizeList { get { return data; } set { data : value; } }

    maide prusate Icon Get(var Int index)
    {
        return cast Icon(this.Array.Get(index));
    }
}
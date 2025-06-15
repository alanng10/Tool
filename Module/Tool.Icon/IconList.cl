class IconList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.IconSizeList : share IconSizeList;
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.PackageList : this.AddItem(this.IconSizeList.Small);
        return true;
    }

    field prusate Icon PackageList { get { return data; } set { data : value; } }

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

    field precate Int ArrayCount { get { return 1; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    field precate IconSizeList IconSizeList { get { return data; } set { data : value; } }

    maide prusate Icon Get(var Int index)
    {
        return cast Icon(this.Array.Get(index));
    }
}
class IconSizeList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Small : this.AddItem(16);
        return true;
    }

    field prusate IconSize Small { get { return data; } set { data : value; } }

    maide precate IconSize AddItem(var Int count)
    {
        var IconSize item;
        item : new IconSize;
        item.Init();
        item.Index : this.Index;
        item.Count : count;
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

    field precate Int ArrayCount { get { return 3; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate IconSize Get(var Int index)
    {
        return cast IconSize(this.Array.Get(index));
    }
}

# Design Tool Ideas

Relative values inside number or string inputs:
    Examples
        X Coord   = Parent + 24pt      (relative to parent)
        Height    = Page   * .5        (50% of page height)
        Font size = "Header" * 2
        Hue       = "Red" + 180
        Rotation  = [custom point]
        Point X   = [other point A].X + [other point B].X / 2
        Img Path  = https://...


*Region / Selection of some points in region (In that case, transformations happen, directly writing new values)
    Position
        X (in pt or mm)
        Y (in pt or mm)
        Z (in pt or mm)
        Count from section of region:
            1 2 3,
            4 5 6,
            7 8 9,
            Vector Position
    
    Rotation
        X (in deg° or %)
        Y (in deg° or %)
        Z (in deg° or %)
        Rotate around section of region:
            1 2 3,
            4 5 6,
            7 8 9,
            Vector Position
    
    Scale
        X (in pt, width)
        Y (in pt, height)
        Z (in pt, depth)
        Rescale center is region:
            1 2 3,
            4 5 6,
            7 8 9,
            Vector Position
    
    Region Fill
        *Fill Layer
            *Fill Point
                X (in pt or mm)
                Y (in pt or mm)
                Z (in pt or mm)
                Filled with
                    Type
                        Color,
                            C
                            I
                            E
                        Image/ Video/ Gif/ Texture Path
                            Autoplay?
                            Sound?
                            Fill, Tile...
                    Generated Material
                    Opacity
                    Blend Mode
            Opacity
            Blend Mode
        Opacity
        Blend Mode
    
    Image Adjustments / Effects
        Drop Shadow,
        Inner Shadow,
        Layer Blur,
        Background Blur,
        Roughness,
        Oil Filter,
        Contrast,
        Sharpness,
        Exposure,
        ....

    List - everything here can be auto, pretty much
        Scale
            X (width)
            Y (height)
            Z (depth)
        Space between items
            X (in row)
            Y (in column)
            Z (in stack)
        Order
            1 (default X)
            2 (default Y)
            3 (default Z)
        WrapAfter (two of these would often not even do anything/ look gray.)
            X (number/ pt/ auto)
            Y (number/ pt/ auto)
            Z (number/ pt/ auto)






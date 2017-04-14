{
    // units
    nanosecond: 1.0,
    ns:         self["nanosecond"],
    second:     1.0e9*self["nanosecond"],
    s:          self["second"],
    millisecond:1.0e6*self["nanosecond"],
    ms:         self["millisecond"],
    microsecond:1.0e3*self["nanosecond"],
    us:         self["microsecond"],
    picosecond: 1.0e-3*self["nanosecond"],

    millimeter: 1.0,
    mm:         self["millimeter"],
    meter:      1000.0*self["millimeter"],

    // vectors
    point(x,y,z,u) :: {x:x*u, y:y*u, z:z*u},
    ray(p1,p2) :: {tail:p1, head:p2},

    Point :: {x:0,y:0,z:0},
    Ray :: {tail:self["Point"],head:self["Point"]},
    Track :: { time:0.0, charge:-1, ray:self["Ray"] },

    // Configurables
    Component :: {
	type:"",
	name:"",
	data:{}
    },
    TrackDepos :: self["Component"] + { type: "TrackDepos" },

    // DFP
    Node :: {type:"",name:"",port:0},
    uvw:: ["U","V","W"],
    conn_uvw_uvw(a,b,p)::
    {
	tail: {type:a, name:a + $.uvw[p], port:p},
	head: {type:b, name:b + $.uvw[p], port:p},
    },
    conn_one_uvw(a,b,p)::
    {
	tail: {type:a, name:a},
	head: {type:b, name:b + $.uvw[p]},
    },
    conn_uvw_one(a,b,p)::
    {
	tail: {type:a, name:a + $.uvw[p]},
	head: {type:b, name:b,            port:p},
    },
    
}


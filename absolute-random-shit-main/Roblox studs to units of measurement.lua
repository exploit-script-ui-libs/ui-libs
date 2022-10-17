local Convert = {
    ["Inches"] = {
        ["StudToIn"] = function(Studs)
            return Studs * (28 / 2.54)
        end,
        ["InToStud"] = function(In)
            return In / (28 * 2.54)
        end
    },
    ["Millimeters"] = {
        ["StudToMm"] = function(Studs)
            return Studs * 280
        end,
        ["MmToStud"] = function(Mm)
            return Mm / 280
        end
    },
    ["Centimeters"] = {
        ["StudToCM"] = function(Studs)
            return Studs * 28
        end,
        ["CmToStud"] = function(Cm)
            return Cm / 28
        end
    },
    ["Meters"] = {
        ["StudToM"] = function(Studs)
            return Studs * .28
        end,
        ["MToStud"] = function(M)
            return M / .28
        end
    },
    ["Kilometers"] = {
        ["StudToKm"] = function(Studs)
            return Studs * .00028
        end,
        ["KmToStud"] = function(Km)
            return Km / .00028
        end
    }
}

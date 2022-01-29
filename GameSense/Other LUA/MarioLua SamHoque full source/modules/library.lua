local a = require('bit')
local c = require "ffi"
local d = {}
local e = entity.get_local_player()
c.cdef [[
	typedef struct {
		double x;
		double y;
	} mariolua_vector2;
]]
local a8 = {}
function a8.same(a9, b)
    local aa = {}
    local r = {}
    for l, m in pairs(a9) do
        r[l] = m;
        aa[m] = true
    end ;
    for l, m in pairs(b) do
        if aa[m] ~= nil then
            r[l] = nil
        else
            return false
        end
    end ;
    return true
end;
function a8.pairs(B, ...)
    local i, a9, l, m = 1, { ... }
    return function()
        repeat l, m = next(B, l)
            if l == nil then
                i, B = i + 1, a9[i]
            end until l ~= nil or not B;
        return l, m
    end
end;
function a8.find(a9, q)
    if a9 == nil then
        return
    end ;
    for i = 1, #a9 do
        if a9[i] == q then
            return i
        end
    end ;
    return nil
end;
function a8.difference(a9, b)
    local aa = {}
    local r = {}
    for l, m in pairs(a9) do
        r[l] = m;
        aa[m] = true
    end ;
    for l, m in pairs(b) do
        if aa[m] ~= nil then
            r[l] = nil
        end
    end ;
    return r
end;
function a8.remove(a9, q)
    if a9 == nil then
        return
    end ;
    if type(q) == 'number' then
        table.remove(a9, i)
    else
        for i = 1, #a9 do
            if a9[i] == q then
                table.remove(a9, i)
            end
        end
    end
end;
function a8.table_to_text(ab, ac)
    local result = ""
    if type(ab) == 'string' then
        return ab
    end ;
    for l, m in pairs(ab) do
        local ad;
        if type(m) == "table" then
            ad = result .. a8.table_to_text(m, ac)
        elseif type(m) == "boolean" then
            ad = result .. tostring(m)
        else
            ad = result .. m
        end ;
        local ae, af = renderer.measure_text('c', ad .. ", ")
        if ae <= ac then
            result = ad .. ", "
        else
            result = result;
            break
        end
    end ;
    if result ~= "" then
        result = result:sub(1, result:len() - 2)
    end ;
    return result
end;
function a8.spairs(B, ag)
    local ah = {}
    for l in pairs(B) do
        ah[#ah + 1] = l
    end ;
    if ag then
        table.sort(ah, function(a9, b)
            return ag(B, a9, b)
        end)
    else
        table.sort(ah)
    end ;
    local i = 0;
    return function()
        i = i + 1;
        if ah[i] then
            return ah[i], B[ah[i]]
        end
    end
end;
function a8.table_to_string3(ab, ai)
    local result = "{"
    if type(ab) == 'string' then
        return ab
    end ;
    for l, m in a8.spairs(ab) do
        if type(l) == "string" and tonumber(l) ~= nil then
            if math.abs(tonumber(l)) >= 0 then
                result = result .. "[" .. l .. "]" .. "="
            end
        elseif type(l) == "string" then
            result = result .. "[\'" .. l .. "\']" .. "="
        end ;
        if type(m) == "table" then
            result = result .. a8.table_to_string3(m)
        elseif type(m) == "boolean" then
            result = result .. tostring(m)
        elseif type(m) == "string" then
            result = result .. "\'" .. m .. "\'"
        elseif type(m) ~= 'function' then
            result = result .. m
        end ;
        result = result .. ","
    end ;
    if result ~= "" then
        result = result:sub(1, result:len() - 1)
    end ;
    if result:len() <= 1 then
        result = "{"
    end ;
    return result .. "}"
end;
function a8.tbl2str2(ab)
    local aj = #ab;
    local ak = ''
    for l, m in a8.pairs(ab) do
        ak = ak .. (l == 1 and '{\n' or '') .. '[' .. l .. '] = ' .. m .. ',' .. (l == aj and '\n}' or '\n')
    end ;
    return ak
end;
function a8.table_to_string(a9)
    local result = '{'
    for i = 1, #a9 do
        if type(a9[i]) == 'string' then
            result = result .. '[\'' .. a9[i] .. '\']' .. '='
        end ;
        if type(a9[i]) == 'table' then
            result = result .. a8.table_to_string(a9[i])
        elseif type(a9[i]) == 'boolean' then
            result = result .. tostring(a9[i])
        elseif type(a9[i]) == 'number' then
            result = result .. tostring(a9[i])
        elseif type(a9[i]) == 'function' then
            result = result
        else
            result = result .. '\'' .. a9[i] .. '\''
        end ;
        result = result .. ','
    end ;
    if result ~= '{' then
        result = result:sub(1, result:len() - 1)
    end ;
    return result .. '}'
end;
function a8.table_to_json(B)
    local function al(a9)
        local am = {}
        for l, m in pairs(a9) do
            local an = type(l)
            local ao = type(m)
            local a6 = an == "string" and "\"" .. l .. "\":" or an == "number" and ""
            local ap = ao == "table" and al(m) or ao == "boolean" and tostring(m) or ao == "string" and "\"" .. m .. "\"" or ao == "number" and m;
            am[#am + 1] = a6 and ap and tostring(a6) .. tostring(ap) or nil
        end ;
        if table.maxn(a9) == 0 then
            return "{" .. table.concat(am, ",") .. "}"
        else
            return "[" .. table.concat(am, ",") .. "]"
        end
    end;
    assert(type(B) == "table")
    return al(B)
end;
function a8.exists(aq, ar)
    local m;
    for as, m in pairs(aq) do
        if m == ar then
            return true
        elseif type(m) == "table" then
            return a8.exists(m, ar)
        end
    end ;
    return false
end;
function a8.find_index(ab, M)
    local m;
    for as, m in pairs(ab) do
        if as == M then
            return m
        elseif type(m) == "table" then
            return a8.find_index(m, M)
        end
    end ;
    return false, print('Could not find index "' .. M .. '" in table.')
end;
function a8.find_content(ab, at)
    local m;
    for as, m in pairs(ab) do
        if as == at then
            return m
        elseif type(m) == "table" then
            return a8.find_content(m, at)
        end
    end ;
    return false, print('Could not find content "' .. at .. '" in table.')
end;
function a8.Contains(a9, q)
    if a9 == nil or q == nil then
        return false
    end ;
    for i = 1, #a9 do
        if a9[i] == q then
            return true
        end
    end ;
    return false
end;
function a8.get_keys(a9)
    local ah = {}
    for a6, as in pairs(a9) do
        table.insert(ah, a6)
    end ;
    return ah
end;
function a8.table_index(table, ap)
    for m, l in pairs(table) do
        if l == ap then
            return m
        end
    end ;
    return -1
end;
local au = {}
function au.hex2rgb(_)
    _ = _:gsub("#", "")
    return tonumber("0x" .. _:sub(1, 2)), tonumber("0x" .. _:sub(3, 4)), tonumber("0x" .. _:sub(5, 6))
end;
function au.is_even(av)
    return av % 2 == 0
end;
function au.is_odd(av)
    return av % 2 ~= 0
end;
function au.percent(aw, ax)
    if tonumber(aw) and tonumber(ax) then
        return ax * aw / 100
    end ;
    return false
end;
function au.percentof(ay, ax)
    ay = ay == 0 and 1 or ay;
    ax = ax == 0 and 1 or ax;
    if tonumber(ay) and tonumber(ax) then
        return 100 - (ax - ay) / ax * 100
    end ;
    return false
end;
function au.round(av, az)
    av = av or 0;
    local aA = 10 ^ (az or 0)
    return math.floor(av * aA + 0.5) / aA
end;
function au.toInteger(v)
    return math.floor(v + 0.5)
end;
function au.between(m, min, ac)
    return m and min and ac and (m > min and m < ac) or false
end;
function au.no_decimals(av)
    av = av or 0;
    return au.round(av * 1) * 1
end;
function au.IsNumberNegative(aB)
    return string.sub(tostring(aB), 1, 1) == "-"
end;
function au.rad2deg(ap)
    return ap * 180 / math.pi
end;
function au.deg2rad(deg)
    return deg * math.pi / 180
end;
function au.toBits(av)
    local B = {}
    while av > 0 do
        rest = math.fmod(av, 2)
        B[#B + 1] = rest;
        av = (av - rest) / 2
    end ;
    return B
end;
function au.ticks_to_time(aC)
    return globals.tickinterval() * aC
end;
function au.time_to_ticks(aD)
    return 0.5 + aD / globals.tickinterval()
end;
function au.TimeToTicks(B)
    return au.round(B / globals.tickinterval())
end;
function au.distance_3d(aE, aF, aG, aH, aI, aJ)
    return math.sqrt((aE - aH) * (aE - aH) + (aF - aI) * (aF - aI))
end;
function au.diff(a9, b)
    local a9, b = a.bxor(a9, b), 0;
    while a9 > 0 do
        b = b + a.band(a9, 1)
        a9 = a.rshift(a9, 1)
    end ;
    return b
end;
function au.average(B)
    local aK = 0;
    for as, m in pairs(B) do
        aK = aK + m
    end ;
    return aK / #B
end;
function au.clamp(x, min, ac)
    x = x or 0;
    ac = ac or 0;
    min = min or 0;
    return math.min(math.max(min, x), ac)
end;
function au.sign(x)
    if x > 0 then
        return 1
    end ;
    if x == 0 then
        return 0
    end ;
    return -1
end;
function au.isInsideRect(aE, aF, aH, aI, aL, aM)
    return aL >= aE and aL <= aH and aM >= aF and aM <= aI
end;
function au.rect_getNearestCorner(x, y, aN, aO, aL, aM)
    return nearest(aL, x, x + aN), nearest(aM, y, y + aO)
end;
function au.rect_getSegmentIntersectionIndices(x, y, aN, aO, aE, aF, aH, aI, aP, aQ)
    aP, aQ = aP or 0, aQ or 1;
    local aR, aS = aH - aE, aI - aF;
    local aT, aU;
    local aV, aW, aX, aY = 0, 0, 0, 0;
    local aZ, a_, r;
    for b0 = 1, 4 do
        if b0 == 1 then
            aT, aU, aZ, a_ = -1, 0, -aR, aE - x
        elseif b0 == 2 then
            aT, aU, aZ, a_ = 1, 0, aR, x + aN - aE
        elseif b0 == 3 then
            aT, aU, aZ, a_ = 0, -1, -aS, aF - y + 5
        else
            aT, aU, aZ, a_ = 0, 1, aS, y + aO - 5 - aF
        end ;
        if aZ == 0 then
            if a_ <= 0 then
                return nil
            end
        else
            r = a_ / aZ;
            if aZ < 0 then
                if r > aQ then
                    return nil
                elseif r > aP then
                    aP, aV, aW = r, aT, aU
                end
            else
                if r < aP then
                    return nil
                elseif r < aQ then
                    aQ, aX, aY = r, aT, aU
                end
            end
        end
    end ;
    return aP, aQ, aV, aW, aX, aY
end;
function au.rect_getDiff(aE, aF, b1, b2, aH, aI, b3, b4)
    return aH - aE - b1, aI - aF - b2, b1 + b3, b2 + b4
end;
function au.rect_containsPoint(x, y, aN, aO, aL, aM)
    return aL - x > DELTA and aM - y > DELTA and x + aN - aL > DELTA and y + aO - aM > DELTA
end;
function au.rect_isIntersecting(aE, aF, b1, b2, aH, aI, b3, b4)
    return aE < aH + b3 and aH < aE + b1 and aF < aI + b4 and aI < aF + b2
end;
function au.rect_getSquareDistance(aE, aF, b1, b2, aH, aI, b3, b4)
    local aR = aE - aH + (b1 - b3) / 2;
    local aS = aF - aI + (b2 - b4) / 2;
    return aR * aR + aS * aS
end;
function au.rect_detectCollision(aE, aF, b1, b2, aH, aI, b3, b4, b5, b6)
    b5 = b5 or aE;
    b6 = b6 or aF;
    local aR, aS = b5 - aE, b6 - aF;
    local x, y, aN, aO = au.rect_getDiff(aE, aF, b1, b2, aH, aI, b3, b4)
    local b7, b8, aT, aU;
    if au.rect_containsPoint(x, y, aN, aO, 0, 0) then
        local aL, aM = au.rect_getNearestCorner(x, y, aN, aO, 0, 0)
        local b9, ba = min(b1, abs(aL)), min(b2, abs(aM))
        b8 = -b9 * ba;
        b7 = true
    else
        local aP, aQ, aV, aW = au.rect_getSegmentIntersectionIndices(x, y, aN, aO, 0, 0, aR, aS, -math.huge, math.huge)
        if aP and aP < 1 and abs(aP - aQ) >= DELTA and (0 < aP + DELTA or 0 == aP and aQ > 0) then
            b8, aT, aU = aP, aV, aW;
            b7 = false
        end
    end ;
    if not b8 then
        return
    end ;
    local bb, bc;
    if b7 then
        if aR == 0 and aS == 0 then
            local aL, aM = au.rect_getNearestCorner(x, y, aN, aO, 0, 0)
            if abs(aL) < abs(aM) then
                aM = 0
            else
                aL = 0
            end ;
            aT, aU = sign(aL), sign(aM)
            bb, bc = aE + aL, aF + aM
        else
            local aP, as;
            aP, as, aT, aU = au.rect_getSegmentIntersectionIndices(x, y, aN, aO, 0, 0, aR, aS, -math.huge, 1)
            if not aP then
                return
            end ;
            bb, bc = aE + aR * aP, aF + aS * aP
        end
    else
        bb, bc = aE + aR * b8, aF + aS * b8
    end
end;
function au.convert_notation(q)
    q = tostring(q)
    local bd = cstring.split_by_delimiter(q, 'e')
    local be = tonumber(bd[1]) * 10 ^ tonumber(bd[2]:gsub('e', ''))
    return be
end;
function au.nearest_value(table, bf)
    local bg, bh;
    for i, y in ipairs(table) do
        if not bg or math.abs(bf - y) < bg then
            bg = math.abs(bf - y)
            bh = i
        end
    end ;
    return bh, table[bh]
end;
local bi = {}
setmetatable(bi, bi)
local bj = { length = "getLength", normalized = "getNormalized", angle = "getAngle", length2 = "getLengthSquared", copy = "getCopy", inverse = "getInverse", floor = "getFloor", ceil = "getCeil" }
function bi.__index(B, l)
    if bj[l] then
        return bi[bj[l]](B)
    end ;
    return rawget(bi, l)
end;
function bi.getLength(m)
    return math.sqrt(m.x * m.x + m.y * m.y)
end;
function bi.getLengthSquared(m)
    return m.x * m.x + m.y * m.y
end;
function bi.getNormalized(m)
    local bk = m.length;
    if bk == 0 then
        return bi(0, 0)
    end ;
    return bi(m.x / bk, m.y / bk)
end;
function bi.getAngle(m)
    return math.atan2(m.y, m.x)
end;
function bi.getCopy(m)
    return bi(m.x, m.y)
end;
function bi.getInverse(m)
    return bi(1 / m.x, 1 / m.y)
end;
function bi.getFloor(m)
    return bi(math.floor(m.x), math.floor(m.y))
end;
function bi.getCeil(m)
    return bi(math.ceil(m.x), math.ceil(m.y))
end;
function bi.__newindex(B, l, m)
    if l == "length" then
        local u = B.normalized * m;
        B.x = u.x;
        B.y = u.y;
        return
    end ;
    if l == "angle" then
        local u = B:angled(m)
        B.x = u.x;
        B.y = u.y;
        return
    end ;
    if B == bi then
        rawset(B, l, m)
    else
        error("[MarioLua] Cannot assign a new property '" .. l .. "' to a Vector2", 2)
    end
end;
function bi.angled(m, bl)
    local bk = m.length;
    return bi(math.cos(bl) * bk, math.sin(bl) * bk)
end;
function bi.trim(m, bm)
    if m.length < bm then
        return m
    end ;
    return m.normalized * bm
end;
function bi.split(m)
    return m.x, m.y
end;
local function bn(x, min, ac)
    return math.min(math.max(min, x), ac)
end;
function bi.clamp(m, bo, bp)
    return bi(bn(m.x, bo.x, bp.x), bn(m.y, bo.y, bp.y))
end;
function bi.hadamard(bq, br)
    return bi(bq.x * br.x, bq.y * br.y)
end;
function bi.rotated(m, bl)
    local cos = math.cos(bl)
    local sin = math.sin(bl)
    return bi(m.x * cos - m.y * sin, m.x * sin + m.y * cos)
end;
local bs = { xy = { "x", "y" }, yx = { "y", "x" } }
local function bt(bu, i)
    i = i + 1;
    if i > 2 then
        return nil
    end ;
    return i, bu[i]
end;
function bi.axes(ag)
    return bt, bs[ag or "yx"], 0
end;
local function bv(d, l)
    if l == nil then
        l = "x"
    elseif l == "x" then
        l = "y"
    else
        l = nil
    end ;
    return l, d[l]
end;
function bi.__pairs(m)
    return bv, m, nil
end;
function bi.isVector(bw)
    return c.istype("mariolua_vector2", bw)
end;
function bi.__add(bq, br)
    return bi(bq.x + br.x, bq.y + br.y)
end;
function bi.__sub(bq, br)
    return bi(bq.x - br.x, bq.y - br.y)
end;
function bi.__mul(bq, bx)
    if type(bq) == "number" then
        return bi(bx.x * bq, bx.y * bq)
    end ;
    if type(bx) == VECTORTYPE then
        return bq.x * bx.x + bq.y * bx.y
    else
        return bi(bq.x * bx, bq.y * bx)
    end
end;
function bi.__div(bq, bx)
    if type(bx) == "number" then
        if bx == 0 then
            error("Vector2 NaN occured", 2)
        end ;
        return bi(bq.x / bx, bq.y / bx)
    elseif type(bx) == VECTORTYPE then
        if bx.x * bx.y == 0 then
            error("Vector2 NaN occured", 2)
        end ;
        return bi(bq.x / bx.x, bq.y / bx.y)
    end
end;
function bi.__unm(m)
    return bi(-m.x, -m.y)
end;
function bi.__eq(bq, br)
    if not bi.isVector(bq) or not bi.isVector(br) then
        return false
    end ;
    return bq.x == br.x and bq.y == br.y
end;
function bi.__mod(bq, br)
    return bi(bq.x * br.x, bq.y * br.y)
end;
function bi.__tostring(B)
    return string.format("Vector2{%.4f, %.4f}", B.x, B.y)
end;
function bi.__concat(L, m)
    return tostring(L) .. tostring(m)
end;
function bi.__len(m)
    return math.sqrt(m.x * m.x + m.y * m.y)
end;
function bi.__call(B, x, y)
    return c.new("mariolua_vector2", x or 0, y or 0)
end;
local by = { up = bi(0, -1), down = bi(0, 1), left = bi(-1, 0), right = bi(1, 0), top = bi(0, -1), bottom = bi(0, 1) }
function bi.dir(bz)
    return by[bz] and by[bz].copy or bi()
end;
function d.random_2d(bA)
    local bB = math.rad(math.random(270 + bA / 2, 270 - bA / 2))
    local bC = bi(math.cos(bB), math.sin(bB))
    bC.x = bC.x;
    bC.y = bC.y;
    return bC
end;
function d.distance_2d(aE, aF, aH, aI)
    return math.floor(math.sqrt((aH - aE) ^ 2 + (aI - aF) ^ 2) * 0.0833)
end;
local bD = {}
bD.__index = bD;
function bD.__call(d, bE, bF, bG)
    bE = bE or d.x;
    bF = bF or d.y;
    bG = bG or d.z;
    d.x = bE;
    d.y = bF;
    d.z = bG
end;
local function bH(x, y, bI)
    return setmetatable({ x = x or 0, y = y or 0, z = bI or 0 }, bD)
end;
function bD.__eq(a9, b)
    return a9.x == b.x and a9.y == b.y and a9.z == b.z
end;
function bD.__unm(a9)
    return bH(-a9.x, -a9.y, -a9.z)
end;
function bD.__add(a9, b)
    local bJ = type(a9)
    local bK = type(b)
    if bJ == "table" and bK == "table" then
        return bH(a9.x + b.x, a9.y + b.y, a9.z + b.z)
    elseif bJ == "table" and bK == "number" then
        return bH(a9.x + b, a9.y + b, a9.z + b)
    elseif bJ == "number" and bK == "table" then
        return bH(a9 + b.x, a9 + b.y, a9 + b.z)
    end
end;
function bD.__sub(a9, b)
    local bJ = type(a9)
    local bK = type(b)
    if bJ == "table" and bK == "table" then
        return bH(a9.x - b.x, a9.y - b.y, a9.z - b.z)
    elseif bJ == "table" and bK == "number" then
        return bH(a9.x - b, a9.y - b, a9.z - b)
    elseif bJ == "number" and bK == "table" then
        return bH(a9 - b.x, a9 - b.y, a9 - b.z)
    end
end;
function bD.__mul(a9, b)
    local bJ = type(a9)
    local bK = type(b)
    if bJ == "table" and bK == "table" then
        return bH(a9.x * b.x, a9.y * b.y, a9.z * b.z)
    elseif bJ == "table" and bK == "number" then
        return bH(a9.x * b, a9.y * b, a9.z * b)
    elseif bJ == "number" and bK == "table" then
        return bH(a9 * b.x, a9 * b.y, a9 * b.z)
    end
end;
function bD.__div(a9, b)
    local bJ = type(a9)
    local bK = type(b)
    if bJ == "table" and bK == "table" then
        return bH(a9.x / b.x, a9.y / b.y, a9.z / b.z)
    elseif bJ == "table" and bK == "number" then
        return bH(a9.x / b, a9.y / b, a9.z / b)
    elseif bJ == "number" and bK == "table" then
        return bH(a9 / b.x, a9 / b.y, a9 / b.z)
    end
end;
function bD.__tostring(a9)
    return "( " .. a9.x .. ", " .. a9.y .. ", " .. a9.z .. " )"
end;
function bD:clear()
    self.x = 0.0;
    self.y = 0.0;
    self.z = 0.0
end;
function bD:unpack()
    return self.x, self.y, self.z
end;
function bD:length_2d_sqr()
    return self.x * self.x + self.y * self.y
end;
function bD:length_sqr()
    return self.x * self.x + self.y * self.y + self.z * self.z
end;
function bD:length_2d()
    return math.sqrt(self:length_2d_sqr())
end;
function bD:length()
    return math.sqrt(self:length_sqr())
end;
function bD:dot(bL)
    return self.x * bL.x + self.y * bL.y + self.z * bL.z
end;
function bD:cross(bL)
    return bH(self.y * bL.z - self.z * bL.y, self.z * bL.x - self.x * bL.z, self.x * bL.y - self.y * bL.x)
end;
function bD:dist_to(bL)
    return (bL - self):length()
end;
function bD:is_zero(bM)
    bM = bM or 0.001;
    if self.x < bM and self.x > -bM and self.y < bM and self.y > -bM and self.z < bM and self.z > -bM then
        return true
    end ;
    return false
end;
function bD:normalize()
    local bN = self:length()
    if bN <= 0.0 then
        return 0.0
    end ;
    self.x = self.x / bN;
    self.y = self.y / bN;
    self.z = self.z / bN;
    return bN
end;
function bD:normalize_no_len()
    local bN = self:length()
    if bN <= 0.0 then
        return
    end ;
    self.x = self.x / bN;
    self.y = self.y / bN;
    self.z = self.z / bN
end;
function bD:normalized()
    local bN = self:length()
    if bN <= 0.0 then
        return bH()
    end ;
    return bH(self.x / bN, self.y / bN, self.z / bN)
end;
function bD:closest_ray_point(bO, bP)
    local bQ = (bP - bO) / bO:dist_to(bP)
    local m = self - bO;
    local bk = m:dot(bQ)
    return bO + bQ * bk
end;
function bD:angle_to(bR)
    local bS = bH(bR.x - self.x, bR.y - self.y, bR.z - self.z)
    local bT = math.deg(math.atan2(bS.y, bS.x))
    local hyp = math.sqrt(bS.x * bS.x + bS.y * bS.y)
    local bU = math.deg(math.atan2(-bS.z, hyp))
    return { bU, bT, 0 }
end;
function bD:lerp(bP, bV)
    return self + (bP - self) * bV
end;
function bD:trace_line_impact(bP, bW)
    bW = bW or -1;
    local bX, bY = client.trace_line(bW, self.x, self.y, self.z, bP.x, bP.y, bP.z)
    local bZ = self:lerp(bP, bX)
    return bX, bY, bZ
end;
function d.normalize_angle(bl)
    local b_;
    local L;
    L = tostring(bl)
    if L == "nan" or L == "inf" then
        return 0.0
    end ;
    if bl >= -180.0 and bl <= 180.0 then
        return bl
    end ;
    b_ = math.fmod(math.fmod(bl + 360.0, 360.0), 360.0)
    if b_ > 180.0 then
        b_ = b_ - 360.0
    end ;
    return b_
end;
function d.to_angle(c0)
    local bN;
    local bU;
    local bT;
    bN = c0:length()
    if bN > 0.0 then
        bU = math.deg(math.atan(-c0.z, bN))
        bT = math.deg(math.atan(c0.y, c0.x))
    else
        if c0.x > 0.0 then
            bU = 270.0
        else
            bU = 90.0
        end ;
        bT = 0.0
    end ;
    return bH(bU, bT, 0.0)
end;
function d.angle_forward(bl)
    local c1 = math.sin(math.rad(bl.x))
    local c2 = math.cos(math.rad(bl.x))
    local c3 = math.sin(math.rad(bl.y))
    local c4 = math.cos(math.rad(bl.y))
    return bH(c2 * c4, c2 * c3, -c1)
end;
function d.angle_right(bl)
    local c1 = math.sin(math.rad(bl.x))
    local c2 = math.cos(math.rad(bl.x))
    local c3 = math.sin(math.rad(bl.y))
    local c4 = math.cos(math.rad(bl.y))
    local c5 = math.sin(math.rad(bl.z))
    local c6 = math.cos(math.rad(bl.z))
    return bH(-1.0 * c5 * c1 * c4 + -1.0 * c6 * -c3, -1.0 * c5 * c1 * c3 + -1.0 * c6 * c4, -1.0 * c5 * c2)
end;
function d.angle_up(bl)
    local c1 = math.sin(math.rad(bl.x))
    local c2 = math.cos(math.rad(bl.x))
    local c3 = math.sin(math.rad(bl.y))
    local c4 = math.cos(math.rad(bl.y))
    local c5 = math.sin(math.rad(bl.z))
    local c6 = math.cos(math.rad(bl.z))
    return bH(c6 * c1 * c4 + -c5 * -c3, c6 * c1 * c3 + -c5 * c4, c6 * c2)
end;
function d.getClosestImpact(c7)
    local c8;
    local c9 = math.huge;
    for i = 1, #tableImpacts do
        if tableImpacts[i] then
            local delta = tableImpacts[i] - c7;
            local ca = delta:Length()
            if ca < c9 then
                c9 = ca;
                c8 = tableImpacts[i]
            end
        end
    end ;
    return c8
end;
function d.get_FOV(cb, cc, cd)
    local ce;
    local cf;
    local delta;
    local cg;
    cf = d.angle_forward(cb)
    delta = (cd - cc):normalized()
    cg = math.acos(cf:dot(delta) / delta:length())
    return math.max(0.0, math.deg(cg))
end;
function d.eye_position(ch)
    local ci = bH(entity.get_origin(ch))
    local cj = entity.get_prop(ch, "m_flDuckAmount") or 0;
    ci.z = ci.z + 46 + (1 - cj) * 18;
    return ci
end;
function d.to_angles(c0, ck)
    if c0[1] == 0 and c0[2] == 0 then
        if c0[3] > 0 then
            ck[1] = -90
        else
            ck[1] = 90
        end ;
        ck[2] = 0
    else
        ck[1] = math.atan2(-c0[3], math.sqrt(c0[1] * c0[1] + c0[2] * c0[2])) * 180 / math.pi;
        ck[2] = math.atan2(c0[2], c0[1]) * 180 / math.pi
    end ;
    ck[3] = 0
end;
function d.distance_3d(a9, b)
    if a9.x == nil then
        return
    end ;
    return math.ceil(math.sqrt(math.pow(a9.x - b.x, 2) + math.pow(a9.y - b.y, 2) + math.pow(a9.z - b.z, 2)))
end;
function d.dot(cl, cm)
    return cl.x * cm.x + cl.y * cm.y
end;
function d.distance(cl, cm)
    local aR, aS = cl.x - cm.x, cl.y - cm.y;
    return math.sqrt(aR * aR + aS * aS)
end;
function d.distance_squared(cl, cm)
    local aR, aS = cl.x - cm.x, cl.y - cm.y;
    return aR * aR + aS * aS
end;
function d.angle(cn, co)
    return math.acos(d.dot(cn, co) / (cn:length() * co:length()))
end;
function d.direction(cn, co)
    return math.atan2(co.y - cn.y, co.x - cn.y)
end;
function d.lerp(cn, co, B)
    return cn * B + co * (1 - B)
end;
function d.rotate_point(cq, cr, cs, ct, bl)
    local cu = 180.0 / math.pi;
    bl = bl * deg2rad;
    local cv = math.cos(bl)
    local cw = math.sin(bl)
    local x = cv * (cq - cs) - cw * (cr - ct)
    local y = cw * (cq - cs) + cv * (cr - ct)
    x = x + cs;
    y = y + ct;
    return x, y
end;
function d.GetClosestPoint(cx, cz, cA)
    local cB = { cA[1] - cx[1], cA[2] - cx[2] }
    local cC = { cz[1] - cx[1], cz[2] - cx[2] }
    local cD = cC[1] ^ 2 + cC[2] ^ 2;
    local cE = cB[1] * cC[1] + cB[2] * cC[2]
    local B = cE / cD;
    return { cx[1] + cC[1] * B, cx[2] + cC[2] * B }
end;
function d.cross_product(bC, cF)
    local cG = {}
    cG.x = bC.y * cF.z - bC.z * cF.y;
    cG.y = bC.z * cF.x - bC.x * cF.z;
    cG.z = bC.x * cF.y - bC.y * cF.x;
    return bH(cG.x, cG.y, cG.z)
end;
local cH = {}
function cH.clamp(bA)
    local bA = bA % 360;
    bA = (bA + 360) % 360;
    if bA > 180 then
        bA = bA - 360
    end ;
    return bA
end;
function cH.normalize_as_yaw(bT)
    if bT > 180 or bT < -180 then
        local cI = au.round(math.abs(bT / 360))
        if bT < 0 then
            bT = bT + 360 * cI
        else
            bT = bT - 360 * cI
        end
    end ;
    return bT
end;
function cH.normalize_yaw2(bl)
    local bl = (bl % 360 + 360) % 360;
    return bl > 180 and bl - 360 or bl
end;
function cH.normalize_yaw(bT)
    if bT == nil then
        return
    end ;
    while bT > 180 do
        bT = bT - 360
    end ;
    while bT < -180 do
        bT = bT + 360
    end ;
    return bT
end;
function cH.Angle_Vector(cJ, cK)
    sp, sy, cp, cy = nil;
    sy = math.sin(math.rad(cK))
    cy = math.cos(math.rad(cK))
    sp = math.sin(math.rad(cJ))
    cp = math.cos(math.rad(cJ))
    return cp * cy, cp * sy, -sp
end;
function cH.CalcAngle2(cL, cM, cN, cO, cP, cQ)
    x_delta = cL - cO;
    y_delta = cM - cP;
    z_delta = cN - cQ;
    hyp = math.sqrt(x_delta ^ 2 + y_delta ^ 2)
    x = math.atan2(z_delta, hyp) * 57.295779513082;
    y = math.atan2(y_delta, x_delta) * 180 / math.pi;
    if y > 180 then
        y = y - 180
    end ;
    if y < -180 then
        y = y + 180
    end ;
    return y
end;
function cH.NormalizeAsYaw(bT)
    if bT > 180 or bT < -180 then
        local cI = au.round(math.abs(bT / 360))
        if bT < 0 then
            bT = bT + 360 * cI
        else
            bT = bT - 360 * cI
        end
    end ;
    return bT
end;
function cH.AngleMod(a9)
    a9 = 360 / 65536 * a.band(a9 * 65536 / 360, 65535)
    return a9
end;
function cH.ApproachAngle(cR, ap, cS)
    cR = cH.AngleMod(cR)
    ap = cH.AngleMod(ap)
    delta = cR - ap;
    if cS < 0 then
        cS = -cS
    end ;
    if delta < -180 then
        delta = delta + 360
    elseif delta > 180 then
        delta = delta - 360
    end ;
    if delta > cS then
        ap = ap + cS
    elseif delta < -cS then
        ap = ap - cS
    else
        ap = cR
    end ;
    return ap
end;
function cH.AngleDiff(cT, cU)
    local delta = math.fmod(cT - cU, 360.0)
    if cT == cU then
        delta = 0
    elseif cT > cU then
        if delta >= 180 then
            delta = delta - 360
        end
    else
        if delta <= -180 then
            delta = delta + 360
        end
    end ;
    return delta
end;
function cH.calculate_angle(x, y, aE, aF)
    local cV = y - aF;
    local cW = x - aE;
    local cX = math.atan(cV / cW)
    cX = cH.normalize_as_yaw(cX * 180 / math.pi)
    if cW >= 0 then
        cX = cH.normalize_as_yaw(cX + 180)
    end ;
    return cX
end;
function cH.CalcAngle(cY, cZ, c_, d0)
    local relativeyaw = math.atan((cZ - d0) / (cY - c_))
    return relativeyaw * 180 / math.pi
end;
function cH.GetMaxFeetYaw(ch)
    if ch == nil then
        return 0
    end ;
    local d1 = { entity.get_prop(ch, "m_vecVelocity") }
    local d2 = math.sqrt(d1[1] ^ 2 + d1[2] ^ 2)
    local d3 = 59 - 58 * d2 / 580;
    return d3
end;
function cH.sincos(sin, cos, ap)
    sin = math.sin(ap) or 0;
    cos = math.cos(ap) or 0;
    return sin, cos
end;
function cH.angle_to_vec(bU, bT)
    local aZ, y = math.rad(bU), math.rad(bT)
    local sp, cp, sy, cy = math.sin(aZ), math.cos(aZ), math.sin(y), math.cos(y)
    return cp * cy, cp * sy, -sp
end;
function cH.angle_forward(ck)
    local c0 = {}
    local sp, sy, cp, cy;
    sp, cp = cH.sincos(sp, cp, au.deg2rad(ck[1]))
    sy, cy = cH.sincos(sy, cy, au.deg2rad(ck[2]))
    c0[1] = cp * cy;
    c0[2] = cp * sy;
    c0[3] = -sp;
    return c0
end;
function cH.get_fov_cos(ch, d4, d5, d6, d7, d8, d9)
    local da, db, dc = entity.get_prop(ch, "m_vecOrigin")
    if da == nil then
        return -1
    end ;
    local aR, aS, dd = bH(da - d7, db - d8, dc - d9):normalize()
    return bH(aR, aS, dd):dot(bH(d4, d5, d6))
end;
function cH.normalize_angle(bl)
    bl = bl % 360;
    bl = (bl + 360) % 360;
    if bl > 180 then
        bl = bl - 360
    end ;
    return bl
end;
function cH.extrapolate_angle(de, ck, df)
    local c0 = d.angle_forward(ck)
    local dg = { client.trace_line(lp(), de[1], de[2], de[3], c0[1] * 8192, c0[2] * 8192, c0[3] * 8192) }
    return { de[1] + c0[1] * au.clamp(0, df, 8192 * dg[1]), de[2] + c0[2] * au.clamp(0, df, 8192 * dg[1]), de[3] + c0[3] * au.clamp(0, df, 8192 * dg[1]) }, 8192 * dg[1]
end;
function cH.vec2_distance(dh, di, dj, dk)
    local dl, dm = dh - dj, di - dk;
    return math.sqrt(dl * dl + dm * dm)
end;
function cH.WorldDistance(dn, dp)
    if dn == 0 and dp == 0 then
        return 0
    end ;
    return math.deg(math.atan2(dp, dn))
end;
function cH.CalcRelativeAngle(cY, cZ, c_, d0)
    local dp = cZ - d0;
    local dn = cY - c_;
    relativeyaw = math.atan(dp / dn)
    relativeyaw = cH.normalize_as_yaw(relativeyaw * 180 / math.pi)
    if dn >= 0 then
        relativeyaw = cH.normalize_as_yaw(relativeyaw + 180)
    end ;
    return relativeyaw
end;
local dq = { __index = cH }
dq.__call = function(bl, dr, bF, ds)
    dr = dr or bl.pitch;
    bF = bF or bl.yaw;
    ds = ds or bl.roll;
    bl.pitch = dr;
    bl.yaw = bF;
    bl.roll = ds
end;
local function dt(bU, bT, du)
    return setmetatable({ pitch = bU or 0, yaw = bT or 0, roll = du or 0 }, dq)
end;
function cH:set(bU, bT, du)
    bU = bU or self.pitch;
    bT = bT or self.yaw;
    du = du or self.roll;
    self.pitch = bU;
    self.yaw = bT;
    self.roll = du
end;
function cH:offset(bU, bT, du)
    bU = self.pitch + bU or 0;
    bT = self.yaw + bT or 0;
    du = self.roll + du or 0;
    self.pitch = self.pitch + bU;
    self.yaw = self.yaw + bT;
    self.roll = self.roll + du
end;
function cH:unpack()
    return self.pitch, self.yaw, self.roll
end;
function dq.__add(dv, dw)
    if type(dv) == "number" then
        return dt(dv + dw.pitch, dv + dw.yaw, dv + dw.roll)
    end ;
    if type(dw) == "number" then
        return dt(dv.pitch + dw, dv.yaw + dw, dv.roll + dw)
    end ;
    return dt(dv.pitch + dw.pitch, dv.yaw + dw.yaw, dv.roll + dw.roll)
end;
function dq.__sub(dv, dw)
    if type(dv) == "number" then
        return dt(dv - dw.pitch, dv - dw.yaw, dv - dw.roll)
    end ;
    if type(dw) == "number" then
        return dt(dv.pitch - dw, dv.yaw - dw, dv.roll - dw)
    end ;
    return dt(dv.pitch - dw.pitch, dv.yaw - dw.yaw, dv.roll - dw.roll)
end;
function dq.__mul(dv, dw)
    if type(dv) == "number" then
        return dt(dv * dw.pitch, dv * dw.yaw, dv * dw.roll)
    end ;
    if type(dw) == "number" then
        return dt(dv.pitch * dw, dv.yaw * dw, dv.roll * dw)
    end ;
    return dt(dv.pitch * dw.pitch, dv.yaw * dw.yaw, dv.roll * dw.roll)
end;
function dq.__div(dv, dw)
    if type(dv) == "number" then
        return dt(dv / dw.pitch, dv / dw.yaw, dv / dw.roll)
    end ;
    if type(dw) == "number" then
        return dt(dv.pitch / dw, dv.yaw / dw, dv.roll / dw)
    end ;
    return dt(dv.pitch / dw.pitch, dv.yaw / dw.yaw, dv.roll / dw.roll)
end;
function d.get_delta(bC, cF)
    local cG = {}
    local dx = {}
    bC = { bC.x, bC.y, bC.z }
    cF = { cF.x, cF.y, cF.z }
    for i = 1, 3, 2 do
        cG[i] = bC[i] - cF[i]
    end ;
    dx = d.to_angles(cG, dx)
    return dx
end;
function d.add(bC, cF)
    local cG = {}
    if bC.x then
        bC = { bC.x, bC.y, bC.z }
        cF = { cF.x, cF.y, cF.z }
    end ;
    for i = 1, 3, 2 do
        cG[i] = bC[i] + cF[i]
    end ;
    return cG
end;
function d.multiply(bC, bf)
    local cG = {}
    if bC.x then
        bC = { bC.x, bC.y, bC.z }
    end ;
    for i = 1, 3, 2 do
        cG[i] = bC[i] * bf
    end ;
    return cG
end;
function d.get_length(x, y)
    return math.sqrt(x ^ 2 + y ^ 2)
end;
function d.normalize(x, y)
    local bk = d.get_length(x, y)
    norm_x = x / bk;
    norm_y = y / bk;
    return norm_x, norm_y
end;
local cstring = {}
function cstring.tohex(L)
    return L:gsub('.', function(o)
        return string.format('%02X', string.byte(o))
    end)
end;
function cstring.fromhex(L)
    return L:gsub('..', function(dy)
        return string.char(tonumber(dy, 16))
    end)
end;
function cstring.stripchars(L, dz)
    local V = L:gsub("[" .. dz:gsub("%W", "%%%1") .. "]", '')
    return V
end;
function cstring.FirstToUpper(L)
    if L == nil then
        L = "nil"
    end ;
    return L:gsub("^%l", string.upper)
end;
function cstring.starts_with(L, dA)
    return L:sub(1, #dA) == dA
end;
function cstring.ends_with(L, dB)
    return dB == "" or L:sub(-#dB) == dB
end;
function cstring.split(dC, dD)
    if dD == nil then
        dD = "%s"
    end ;
    local B = {}
    for L in string.gmatch(dC, "([^" .. dD .. "]+)") do
        table.insert(B, L)
    end ;
    return B
end;
cstring.bytemarkers = { { 0x7FF, 192 }, { 0xFFFF, 224 }, { 0x1FFFFF, 240 } }
function cstring.utf8(dE)
    if dE < 128 then
        return string.char(dE)
    end ;
    local dF = {}
    for dG, dH in ipairs(bytemarkers) do
        if dE <= dH[1] then
            for b = dG + 1, 2, -1 do
                local dI = dE % 64;
                dE = (dE - dI) / 64;
                dF[b] = string.char(128 + dI)
            end ;
            dF[1] = string.char(dH[2] + dE)
            break
        end
    end ;
    return table.concat(dF)
end;
function cstring.random(bk)
    local u = ""
    for i = 1, bk do
        u = u .. string.char(math.random(97, 122))
    end ;
    return u
end;
function cstring.split_by_delimiter(V, dJ)
    result = {}
    for dK in (V .. dJ):gmatch("(.-)" .. dJ) do
        table.insert(result, dK)
    end ;
    return result
end;
function cstring.uuid(dL)
    local u, dL = "", dL or 24;
    for i = 1, dL do
        u = u .. string.char(client.random_int(97, 122))
    end ;
    return u
end;
cstring.b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function cstring.decode(dM)
    local dM = string.gsub(dM, '[^' .. cstring.b .. '=]', '')
    return dM:gsub('.', function(x)
        if x == '=' then
            return ''
        end ;
        local r, C = '', cstring.b:find(x) - 1;
        for i = 6, 1, -1 do
            r = r .. (C % 2 ^ i - C % 2 ^ (i - 1) > 0 and '1' or '0')
        end ;
        return r
    end)     :gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then
            return ''
        end ;
        local o = 0;
        for i = 1, 8 do
            o = o + (x:sub(i, i) == '1' and 2 ^ (8 - i) or 0)
        end ;
        return string.char(o)
    end)
end;
local dN = { ['arrow_1_l'] = '4peE', ['arrow_1_r'] = '4pa6', ['arrow_2_l'] = '4q+H', ['arrow_2_r'] = '4q+I', ['arrow_3_l'] = '4q6Y', ['arrow_3_r'] = '4q6a', ['arrow_4'] = '4oCS' }
local dO = { ['left_1'] = cstring.decode(dN['arrow_1_l']), ['right_1'] = cstring.decode(dN['arrow_1_r']), ['left_2'] = cstring.decode(dN['arrow_2_l']), ['right_2'] = cstring.decode(dN['arrow_2_r']), ['left_3'] = cstring.decode(dN['arrow_3_l']), ['right_3'] = cstring.decode(dN['arrow_3_r']), ['4'] = cstring.decode(dN['arrow_4']) }
local dP = {}
dP.extrapolated_ent_data = {}
function dP.ExtrapolatePosition(dQ, dR, dS, aC, ch)
    aC = aC or 0;
    if aC == 0 then
        return dQ, dR, dS
    end ;
    local dT = globals.tickinterval()
    local x, y, bI = entity.get_prop(ch, "m_vecVelocity")
    if x ~= nil and math.sqrt(x * x + y * y + bI * bI) >= 1.01 then
        for i = 0, aC do
            dQ = dQ + x * dT;
            dR = dR + y * dT;
            dS = dS + bI * dT
        end
    end ;
    dP.extrapolated_ent_data[ch] = aC;
    return dQ, dR, dS
end;
function dP.is_peeking(ch, dU)
    local dV = ch == e and e or ch;
    local d4, d5, d6 = entity.get_prop(dV, "m_vecVelocity")
    local cS = math.sqrt(d4 * d4 + d5 * d5 + d6 * d6)
    if cS < 5 then
        return false
    end ;
    local dW = bH(entity.get_origin(ch))
    local dX = bH(entity.get_origin(e))
    local dY = math.abs(d.distance_3d(dW, dX))
    local dZ = 999999;
    if dP.is_moving(ch) then
        for aC = 1, dU do
            dW = bH(dP.ExtrapolatePosition(dW.x, dW.y, dW.z, dU, ch))
        end
    end ;
    local ca = math.abs(d.distance_3d(dX, dW))
    if ca < dZ then
        dZ = ca
    end ;
    if dZ < dY then
        return true
    end ;
    return dZ < dY
end;
function dP.best_fraction(ch, x, y, bI, aC, b0, d_)
    local e0, e1, e2 = {}, {}, {}
    e0[0], e1[0], e2[0] = entity.hitbox_position(ch, 0)
    e0[0], e1[0], e2[0] = dP.ExtrapolatePosition(e0[0], e1[0], e2[0], aC, ch)
    e0[1], e1[1], e2[1] = e0[0] + 40, e1[0], e2[0]
    e0[2], e1[2], e2[2] = e0[0], e1[0] + 40, e2[0]
    e0[3], e1[3], e2[3] = e0[0] - 40, e1[0], e2[0]
    e0[4], e1[4], e2[4] = e0[0], e1[0] - 40, e2[0]
    e0[5], e1[5], e2[5] = e0[0], e1[0], e2[0] + 40;
    e0[6], e1[6], e2[6] = e0[0], e1[0], e2[0] - 40;
    local e3 = 0;
    local e4 = nil;
    for i = 0, 6 do
        local bX, ch = client.trace_line(ch, e0[i], e1[i], e2[i], x, y, bI)
        if bX > e3 then
            e4 = ch;
            e3 = bX
        end
    end ;
    return e3
end;
function dP.best_damage(ch, x, y, bI, aC, b0, d_)
    local e = entity.get_local_player()
    local e0, e1, e2 = {}, {}, {}
    e0[0], e1[0], e2[0] = entity.hitbox_position(ch, 0)
    e0[0], e1[0], e2[0] = dP.ExtrapolatePosition(e0[0], e1[0], e2[0], aC, ch)
    e0[1], e1[1], e2[1] = e0[0] + 40, e1[0], e2[0]
    e0[2], e1[2], e2[2] = e0[0], e1[0] + 40, e2[0]
    e0[3], e1[3], e2[3] = e0[0] - 40, e1[0], e2[0]
    e0[4], e1[4], e2[4] = e0[0], e1[0] - 40, e2[0]
    e0[5], e1[5], e2[5] = e0[0], e1[0], e2[0] + 40;
    e0[6], e1[6], e2[6] = e0[0], e1[0], e2[0] - 40;
    local e5 = 0;
    for i = 0, 6 do
        local as, e6 = client.trace_bullet(e, x, y, bI, e0[i], e1[i], e2[i])
        if e6 > e5 then
            e5 = e6
        end
    end ;
    return client.scale_damage(ch, 0, e5)
end;
function dP.best_damage2(ch, x, y, bI, aC, b0, d_)
    local e0, e1, e2 = {}, {}, {}
    e0[0], e1[0], e2[0] = entity.hitbox_position(ch, 0)
    e0[0], e1[0], e2[0] = dP.ExtrapolatePosition(e0[0], e1[0], e2[0], aC, ch)
    e0[1], e1[1], e2[1] = e0[0] + 40, e1[0], e2[0]
    e0[2], e1[2], e2[2] = e0[0], e1[0] + 40, e2[0]
    e0[3], e1[3], e2[3] = e0[0] - 40, e1[0], e2[0]
    e0[4], e1[4], e2[4] = e0[0], e1[0] - 40, e2[0]
    e0[5], e1[5], e2[5] = e0[0], e1[0], e2[0] + 40;
    e0[6], e1[6], e2[6] = e0[0], e1[0], e2[0] - 40;
    local e5 = 0;
    for i = 0, 6 do
        local as, e6 = client.trace_bullet(e, x, y, bI, e0[i], e1[i], e2[i])
        if e6 > e5 then
            e5 = e6
        end
    end ;
    return e5
end;
function dP.closest_enemy_distance()
    local e = entity.get_local_player()
    if e == nil then
        return
    end ;
    if not entity.is_alive(e) then
        return
    end ;
    local e7 = nil;
    local e8 = math.huge;
    local e9 = bH(entity.get_prop(e, "m_vecOrigin"))
    local ea = entity.get_prop(e, 'm_angEyeAngles[1]')
    local eb = entity.get_all('CCSPlayer')
    for i = 1, #eb do
        local ec = eb[i]
        if entity.get_prop(ec, "m_iTeamNum") ~= entity.get_prop(e, "m_iTeamNum") then
            local ed = bH(entity.get_prop(ec, "m_vecOrigin"))
            local ee = math.abs(cH.normalize_as_yaw(cH.WorldDistance(e9.x - ed.x, e9.y - ed.y) - ea + 180))
            if ee < e8 then
                e8 = ee;
                e7 = ec
            end
        end
    end ;
    return e7, e8
end;
function dP.get_move_dir(ch)
    if not dP.is_moving(ch) then
        return { 0, 0, 0 }
    end ;
    local ef = { entity.get_prop(ch, "m_vecVelocity") }
    local bT = entity.get_prop(ch, "m_angEyeAngles[1]")
    local d1 = math.sqrt(ef[1] * ef[1] + ef[2] * ef[2])
    local bQ = { 0, 0, 0 }
    d.to_angles(ef, bQ)
    bQ[2] = cH.normalize_as_yaw(bT - 180 - bQ[2])
    return bQ
end;
function dP.get_move_dir_at_target(ch)
    if not dP.is_moving(ch) then
        return { 0, 0, 0 }
    end ;
    local e = entity.get_local_player()
    local dX = bH(entity.get_origin(e))
    local dW = bH(entity.get_origin(ch))
    local eg = cH.normalize_as_yaw(entity.get_prop(ch, "m_angEyeAngles[1]") - dX:angle_to(dW)[2])
    local ef = { entity.get_prop(ch, "m_vecVelocity") }
    local bT = entity.get_prop(ch, "m_angEyeAngles[1]")
    local d1 = math.sqrt(ef[1] * ef[1] + ef[2] * ef[2])
    local bQ = { 0, 0, 0 }
    d.to_angles(ef, bQ)
    bQ[2] = cH.normalize_as_yaw(bT - eg - 180 - bQ[2])
    return bQ
end;
function dP.get_dir_text(ch)
    local bz = nil;
    local eh = dP.is_backwards(ch)
    local ei = 'LEFT'
    local ej = 'RIGHT'
    local ek = dP.get_move_dir_at_target(ch)
    if math.abs(ek[2]) < 45 and math.abs(ek[2]) ~= 0 then
        bz = 'BACKWARDS'
    elseif math.abs(ek[2]) > 135 and math.abs(ek[2]) ~= 0 then
        bz = 'FORWARD'
    elseif ek[2] <= -45 then
        if math.abs(ek[2]) <= 60 then
            bz = 'BACKWARDS_' .. ej
        elseif math.abs(ek[2]) >= 120 then
            bz = 'FORWARD_' .. ej
        else
            bz = ej
        end
    elseif ek[2] >= 45 then
        if ek[2] <= 60 then
            bz = 'BACKWARDS_' .. ei
        elseif ek[2] >= 120 then
            bz = 'FORWARD_' .. ei
        else
            bz = ei
        end
    end ;
    return bz
end;
function dP.is_flying(ch)
    local el = entity.get_prop(ch, "m_hGroundEntity")
    return el == nil
end;
function dP.get_velocity(ch)
    local x, y, bI = entity.get_prop(ch, "m_vecVelocity")
    if x == nil then
        return
    end ;
    return math.sqrt(x * x + y * y + bI * bI)
end;
function dP.is_moving(em)
    local x, y, bI = entity.get_prop(em, "m_vecVelocity")
    return math.sqrt(x * x + y * y + bI * bI) > 1.01
end;
function dP.get_team(ch)
    return dP.teams[entity.get_prop(ch, "m_iTeamNum")]
end;
function dP.is_bot(ch)
    local en = entity.get_prop(ch, "m_fFlags")
    if en and a.band(en, 0x200) == 0x200 then
        return true
    else
        return false
    end
end;
function dP.is_visible(eo)
    if not should_run then
        return -1
    end ;
    for i = 0, 8 do
        if client.visible(entity.hitbox_position(eo, i)) then
            return true
        end
    end ;
    return false
end;
function dP.get_origin_extrapolated(ch, aC)
    ch = ch or e;
    local x, y, bI = entity.get_prop(ch, "m_vecVelocity")
    local ep = bH(entity.get_prop(ch, 'm_vecOrigin'))
    if not x then
        return ep
    end ;
    local d1 = math.floor(math.sqrt(x * x + y * y + bI * bI))
    local eq = math.max(math.floor(aC / 100) * d1 * 3, aC)
    if aC >= 1.01 then
        return bH(dP.ExtrapolatePosition(ep.x, ep.y, ep.z, eq, ch))
    else
        return ep
    end
end;
function dP.get_rotated_pos(dA, er, ca)
    local es = au.deg2rad(deg)(er)
    dA.x = dA.x + cos(es) * ca;
    dA.y = dA.y + sin(es) * ca;
    return dA
end;
function dP.get_body_yaw(ch)
    local as, et = entity.get_prop(ch, "m_angAbsRotation")
    local as, ea = entity.get_prop(ch, "m_angEyeAngles")
    if et == nil or ea == nil then
        return 0
    end ;
    return cH.normalize_as_yaw(et - ea)
end;
function dP.on_ground(ch)
    local en = entity.get_prop(ch, "m_fFlags")
    if a.band(en, 1) == 1 then
        return true
    end ;
    return false
end;
function dP.in_air(ch)
    local en = entity.get_prop(ch, "m_fFlags")
    if a.band(en, 1) == 0 then
        return true
    end ;
    return false
end;
function dP.is_crouching(ch)
    local en = entity.get_prop(ch, "m_fFlags")
    if a.band(en, 4) == 4 then
        return true
    end ;
    return false
end;
function dP.is_thirdperson()
    local x, y, bI = client.eye_position()
    local bU, bT = client.camera_angles()
    bT = bT - 180;
    bU, bT = math.rad(bU), math.rad(bT)
    x = x + math.cos(bT) * 4;
    y = y + math.sin(bT) * 4;
    bI = bI + math.sin(bU) * 4;
    local eu, ev = renderer.world_to_screen(x, y, bI)
    return eu ~= nil
end;
function dP.get_hitbox_pos(ch)
    local ew = {}
    for i = 0, 18 do
        local ex, ey, ez = entity.hitbox_position(ch, i)
        ew[i] = { ex, ey, ez }
    end ;
    return ew
end;
function dP.is_sideways(ch)
    local e = entity.get_local_player()
    local dX = bH(entity.get_origin(e))
    local dW = bH(entity.get_origin(ch))
    local eg = math.abs(cH.normalize_as_yaw(entity.get_prop(ch, "m_angEyeAngles[1]") - dX:angle_to(dW)[2]))
    if eg > 60 and eg < 120 then
        return true
    end ;
    return false
end;
function dP.is_forward(ch)
    local e = entity.get_local_player()
    local dX = bH(entity.get_origin(e))
    local dW = bH(entity.get_origin(ch))
    local eg = math.abs(cH.normalize_as_yaw(entity.get_prop(ch, "m_angEyeAngles[1]") - dX:angle_to(dW)[2]))
    if eg >= 120 and eg <= 180 then
        return true
    end ;
    return false
end;
function dP.is_backwards(ch)
    local e = entity.get_local_player()
    local dX = bH(entity.get_origin(e))
    local dW = bH(entity.get_origin(ch))
    local eg = math.abs(cH.normalize_as_yaw(entity.get_prop(ch, "m_angEyeAngles[1]") - dX:angle_to(dW)[2]))
    if eg >= 0 and eg <= 60 then
        return true
    end ;
    return false
end;
function dP.is_local_backwards()
    local e = entity.get_local_player()
    local dX = bH(entity.get_origin(e))
    local eA = bH(client.camera_angles())
    local eB = bH(client.camera_position())
    local eg = math.abs(cH.normalize_as_yaw(eA.y - eB:angle_to(dX)[2]))
    if eg >= 120 and eg <= 180 then
        return true
    end ;
    return false
end;
function dP.get_side(ch)
    local e = entity.get_local_player()
    local dX = bH(entity.get_origin(e))
    local dW = bH(entity.get_origin(ch))
    local eg = cH.normalize_as_yaw(entity.get_prop(ch, "m_angEyeAngles[1]") - dX:angle_to(dW)[2])
    if dP.is_sideways(ch) then
        if eg < 0 then
            if math.abs(eg) <= 75 then
                return 'BACKWARDS_RIGHT'
            elseif math.abs(eg) >= 105 then
                return 'FORWARD_RIGHT'
            else
                return 'RIGHT'
            end
        elseif eg > 0 then
            if eg <= 75 then
                return 'BACKWARDS_LEFT'
            elseif eg >= 105 then
                return 'FORWARD_LEFT'
            else
                return 'LEFT'
            end
        end
    elseif dP.is_backwards(ch) then
        return 'BACKWARDS'
    elseif dP.is_forward(ch) then
        return 'FORWARD'
    end
end;
function dP.get_vector_velocity(ch)
    local d1 = {}
    d1[0] = entity.get_prop(ch, "m_vecVelocity", 0)
    d1[1] = entity.get_prop(ch, "m_vecVelocity", 1)
    d1[2] = entity.get_prop(ch, "m_vecVelocity", 2)
    return d1
end;
local eC = {}
eC.index = {}
eC.weapons_data, eC.weapons_data_types = { [1] = { "deagle", 1, 230, 700, "Desert Eagle", 7, 0.225 }, [2] = { "elite", 1, 240, 400, "Dual Berettas", 30, 0.12 }, [3] = { "fiveseven", 1, 240, 500, "Five-SeveN", 20, 0.15 }, [4] = { "glock", 1, 240, 200, "Glock-18", 20, 0.15 }, [7] = { "ak47", 2, 215, 2700, "AK-47", 30, 0.1 }, [8] = { "aug", 2, 220, 3300, "AUG", 30, 0.09 }, [9] = { "awp", 2, 200, 4750, "AWP", 10, 1.455 }, [10] = { "famas", 2, 220, 2250, "FAMAS", 25, 0.09 }, [11] = { "g3sg1", 2, 215, 5000, "G3SG1", 20, 0.25 }, [13] = { "galilar", 2, 215, 2000, "Galil AR", 35, 0.09 }, [14] = { "m249", 3, 195, 5200, "M249", 100, 0.08 }, [16] = { "m4a1", 2, 225, 3100, "M4A4", 30, 0.09 }, [17] = { "mac10", 4, 240, 1050, "MAC-10", 30, 0.075 }, [19] = { "p90", 4, 230, 2350, "P90", 50, 0.07 }, [23] = { "mp5sd", 4, 235, 1500, "MP5-SD", 30, 0.08 }, [24] = { "ump45", 4, 230, 1200, "UMP-45", 25, 0.09 }, [25] = { "xm1014", 3, 215, 2000, "XM1014", 7, 0.35 }, [26] = { "bizon", 4, 240, 1400, "PP-Bizon", 64, 0.08 }, [27] = { "mag7", 3, 225, 1300, "MAG-7", 5, 0.85 }, [28] = { "negev", 3, 150, 1700, "Negev", 150, 0.075 }, [29] = { "sawedoff", 3, 210, 1100, "Sawed-Off", 7, 0.85 }, [30] = { "tec9", 1, 240, 500, "Tec-9", 18, 0.12 }, [31] = { "taser", 5, 220, 200, "Zeus x27", 1, 0.15 }, [32] = { "hkp2000", 1, 240, 200, "P2000", 13, 0.17 }, [33] = { "mp7", 4, 220, 1500, "MP7", 30, 0.08 }, [34] = { "mp9", 4, 240, 1250, "MP9", 30, 0.07 }, [35] = { "nova", 3, 220, 1050, "Nova", 8, 0.88 }, [36] = { "p250", 1, 240, 300, "P250", 13, 0.15 }, [38] = { "scar20", 2, 215, 5000, "SCAR-20", 20, 0.25 }, [39] = { "sg556", 2, 210, 2750, "SG 553", 30, 0.09 }, [40] = { "ssg08", 2, 230, 1700, "SSG 08", 10, 1.25 }, [41] = { "knifegg", 6, 250, 0, "Knife", -1, 0.15 }, [42] = { "knife", 6, 250, 0, "Knife", -1, 0.15 }, [43] = { "flashbang", 7, 245, 200, "Flashbang", -1, 0.15 }, [44] = { "hegrenade", 7, 245, 300, "High Explosive Grenade", -1, 0.15 }, [45] = { "smokegrenade", 7, 245, 300, "Smoke Grenade", -1, 0.15 }, [46] = { "molotov", 7, 245, 400, "Molotov", -1, 0.15 }, [47] = { "decoy", 7, 245, 50, "Decoy Grenade", -1, 0.15 }, [48] = { "incgrenade", 7, 245, 600, "Incendiary Grenade", -1, 0.15 }, [49] = { "c4", 8, 250, 0, "C4 Explosive", -1, 0.15 }, [50] = { "item_kevlar", 5, 1, 650, "Kevlar Vest", -1, 0.15 }, [51] = { "item_assaultsuit", 5, 1, 1000, "Kevlar + Helmet", -1, 0.15 }, [52] = { "item_heavyassaultsuit", 5, 1, 6000, "Heavy Assault Suit", -1, 0.15 }, [55] = { "item_defuser", 5, 1, 400, "Defuse Kit", -1, 0.15 }, [56] = { "item_cutters", 5, 1, 400, "Rescue Kit", -1, 0.15 }, [57] = { "healthshot", 9, 250, 0, "Medi-Shot", -1, 0.15 }, [59] = { "knife_t", 6, 250, 0, "Knife", -1, 0.15 }, [60] = { "m4a1_silencer", 2, 225, 3100, "M4A1-S", 25, 0.1 }, [61] = { "usp_silencer", 1, 240, 200, "USP-S", 12, 0.17 }, [63] = { "cz75a", 1, 240, 500, "CZ75-Auto", 12, 0.1 }, [64] = { "revolver", 1, 180, 600, "R8 Revolver", 8, 0.5 }, [68] = { "tagrenade", 7, 245, 100, "Tactical Awareness Grenade", -1, 0.15 }, [69] = { "fists", 6, 275, 0, "Bare Hands", -1, 0.15 }, [70] = { "breachcharge", 8, 245, 300, "Breach Charge", 3, 0.15 }, [72] = { "tablet", 10, 220, 300, "Tablet", 1, 0.15 }, [74] = { "melee", 6, 250, 0, "Knife", -1, 0.15 }, [75] = { "axe", 6, 250, 0, "Axe", -1, 0.15 }, [76] = { "hammer", 6, 250, 0, "Hammer", -1, 0.15 }, [78] = { "spanner", 6, 250, 0, "Wrench", -1, 0.15 }, [80] = { "knife_ghost", 6, 250, 0, "Spectral Shiv", -1, 0.15 }, [81] = { "firebomb", 7, 245, 400, "Fire Bomb", -1, 0.15 }, [82] = { "diversion", 7, 245, 50, "Diversion Device", -1, 0.15 }, [83] = { "frag_grenade", 7, 245, 300, "Frag Grenade", -1, 0.15 }, [84] = { "snowball", 7, 245, 100, "Snowball", -1, 0.15 }, [500] = { "bayonet", 6, 250, 0, "Bayonet", -1, 0.15 }, [505] = { "knife_flip", 6, 250, 0, "Flip Knife", -1, 0.15 }, [506] = { "knife_gut", 6, 250, 0, "Gut Knife", -1, 0.15 }, [507] = { "knife_karambit", 6, 250, 0, "Karambit", -1, 0.15 }, [508] = { "knife_m9_bayonet", 6, 250, 0, "M9 Bayonet", -1, 0.15 }, [509] = { "knife_tactical", 6, 250, 0, "Huntsman Knife", -1, 0.15 }, [512] = { "knife_falchion", 6, 250, 0, "Falchion Knife", -1, 0.15 }, [514] = { "knife_survival_bowie", 6, 250, 0, "Bowie Knife", -1, 0.15 }, [515] = { "knife_butterfly", 6, 250, 0, "Butterfly Knife", -1, 0.15 }, [516] = { "knife_push", 6, 250, 0, "Shadow Daggers", -1, 0.15 }, [519] = { "knife_ursus", 6, 250, 0, "Ursus Knife", -1, 0.15 }, [520] = { "knife_gypsy_jackknife", 6, 250, 0, "Navaja Knife", -1, 0.15 }, [522] = { "knife_stiletto", 6, 250, 0, "Stiletto Knife", -1, 0.15 }, [523] = { "knife_widowmaker", 6, 250, 0, "Talon Knife", -1, 0.15 }, [1349] = { "spraypaint", 11, 250, 0, "Graffiti", 0, 0 } }, { "secondary", "rifle", "heavy", "smg", "equipment", "melee", "grenade", "c4", "boost", "utility", "spray" }
for M, eD in pairs(eC.weapons_data) do
    local eE, eF = ("weapon_" .. eD[1]):gsub("weapon_item_", "item_"), eC.weapons_data_types[eD[2]]
    eC[M] = { console_name = eE, idx = M, type = eF, max_speed = eD[3], price = eD[4], name = eD[5], primary_clip_size = eD[6], cycletime = eD[7] }
    eC.index[eE] = eC[M]
end ;
function eC.get_weapon(M)
    if type(M) == "string" then
        return eC.index[M]
    elseif type(M) == "number" then
        M = a.band(M, 0xFFFF)
        return rawget(eC, M)
    end
end;
local eG = ui.reference("misc", "settings", "menu color")
local eH = {}
eH.CubeOutlineConnections = { { 1, 2 }, { 1, 3 }, { 1, 5 }, { 8, 7 }, { 8, 6 }, { 8, 4 }, { 6, 3 }, { 4, 3 }, { 4, 2 }, { 2, 7 }, { 7, 5 }, { 6, 5 } }
eH.CubeFillConnections = { { 1, 2, 3 }, { 1, 2, 5 }, { 1, 3, 5 }, { 8, 7, 6 }, { 8, 7, 4 }, { 8, 6, 4 }, { 3, 6, 5 }, { 3, 4, 6 }, { 2, 4, 7 }, { 2, 7, 5 }, { 3, 4, 2 }, { 6, 5, 7 } }
local eI = {}
eI.__index = eI;
eI.new_charbuffer = c.typeof("char[?]")
eI.new_intptr = c.typeof("int[1]")
eI.new_widebuffer = c.typeof("wchar_t[?]")
eI.native_Localize_ConvertAnsiToUnicode = vtable_bind("localize.dll", "Localize_001", 15, "int(__thiscall*)(void*, const char*, wchar_t*, int)")
eI.native_Localize_ConvertUnicodeToAnsi = vtable_bind("localize.dll", "Localize_001", 16, "int(__thiscall*)(void*, wchar_t*, char*, int)")
eI.native_Localize_FindSafe = vtable_bind("localize.dll", "Localize_001", 12, "wchar_t*(__thiscall*)(void*, const char*)")
eI.native_Surface_DrawSetColor = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 15, "void(__thiscall*)(void*, int, int, int, int)")
eI.native_Surface_DrawFilledRect = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 16, "void(__thiscall*)(void*, int, int, int, int)")
eI.native_Surface_DrawOutlinedRect = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 18, "void(__thiscall*)(void*, int, int, int, int)")
eI.native_Surface_DrawLine = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 19, "void(__thiscall*)(void*, int, int, int, int)")
eI.native_Surface_DrawPolyLine = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 20, "void(__thiscall*)(void*, int*, int*, int)")
eI.native_Surface_DrawSetTextFont = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 23, "void(__thiscall*)(void*, unsigned long)")
eI.native_Surface_DrawSetTextColor = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 25, "void(__thiscall*)(void*, int, int, int, int)")
eI.native_Surface_DrawSetTextPos = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 26, "void(__thiscall*)(void*, int, int)")
eI.native_Surface_DrawPrintText = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 28, "void(__thiscall*)(void*, const wchar_t*, int, int)")
eI.native_Surface_DrawGetTextureId = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 34, "int(__thiscall*)(void*, const char*)")
eI.native_Surface_DrawGetTextureFile = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 35, "bool(__thiscall*)(void*, int, char*, int)")
eI.native_Surface_DrawSetTextureFile = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 36, "void(__thiscall*)(void*, int, const char*, int, bool)")
eI.native_Surface_DrawSetTextureRGBA = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 37, "void(__thiscall*)(void*, int, const wchar_t*, int, int)")
eI.native_Surface_DrawSetTexture = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 38, "void(__thiscall*)(void*, int)")
eI.native_Surface_DeleteTextureByID = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 39, "void(__thiscall*)(void*, int)")
eI.native_Surface_DrawGetTextureSize = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 40, "void(__thiscall*)(void*, int, int&, int&)")
eI.native_Surface_DrawTexturedRect = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 41, "void(__thiscall*)(void*, int, int, int, int)")
eI.native_Surface_IsTextureIDValid = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 42, "bool(__thiscall*)(void*, int)")
eI.native_Surface_CreateNewTextureID = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 43, "int(__thiscall*)(void*, bool)")
eI.native_Surface_UnlockCursor = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 66, "void(__thiscall*)(void*)")
eI.native_Surface_LockCursor = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 67, "void(__thiscall*)(void*)")
eI.native_Surface_CreateFont = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 71, "unsigned int(__thiscall*)(void*)")
eI.native_Surface_SetFontGlyph = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 72, "void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)")
eI.native_Surface_GetTextSize = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 79, "void(__thiscall*)(void*, unsigned long, const wchar_t*, int&, int&)")
eI.native_Surface_GetCursorPos = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 100, "unsigned int(__thiscall*)(void*, int*, int*)")
eI.native_Surface_SetCursorPos = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 101, "unsigned int(__thiscall*)(void*, int, int)")
eI.native_Surface_DrawOutlinedCircle = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 103, "void(__thiscall*)(void*, int, int, int, int)")
eI.native_Surface_DrawFilledRectFade = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 123, "void(__thiscall*)(void*, int, int, int, int, unsigned int, unsigned int, bool)")
local eJ = { gpx = { svg = {}, jpg = { custom_bg = '' }, png = { custom_bg = '' } } }
local eK = {}
function eJ.create_font(eL, eM, eN, en)
    local eO = 0;
    local B = type(en)
    if B == "number" then
        eO = en
    elseif B == "table" then
        for i = 1, #en do
            eO = eO + en[i]
        end
    else
        error("invalid flags type, has to be number or table", 2)
    end ;
    if eM == nil then
        eM = 0;
        eN = 0;
        eO = 0
    end ;
    local eP = string.format("%s\0%d\0%d\0%d", eL, eM, eN, eO)
    if eK[eP] == nil then
        eK[eP] = eI.native_Surface_CreateFont()
        eI.native_Surface_SetFontGlyph(eK[eP], eL, eM, eN, 0, 0, a.bor(eO), 0, 0)
    end ;
    return eK[eP]
end;
function eJ.draw_print_text(eQ, eR)
    if eR then
        local eS = 1024;
        local eT = eI.new_charbuffer(eS)
        eI.native_Localize_ConvertUnicodeToAnsi(eQ, eT, eS)
        local eU = c.string(eT)
        return eI.native_Surface_DrawPrintText(eQ, eU:len(), 0)
    else
        local eV = 1024;
        local eW = eI.new_widebuffer(eV)
        eI.native_Localize_ConvertAnsiToUnicode(eQ, eW, eV)
        return eI.native_Surface_DrawPrintText(eW, eQ:len(), 0)
    end
end;
function eJ.get_text_size(eX, eQ)
    local eW = eI.new_widebuffer(1024)
    local eY = eI.new_intptr()
    local eZ = eI.new_intptr()
    eI.native_Localize_ConvertAnsiToUnicode(eQ, eW, 1024)
    eI.native_Surface_GetTextSize(eX, eW, eY, eZ)
    local aN = tonumber(eY[0])
    local aO = tonumber(eZ[0])
    return aN, aO
end;
function eJ.localize_string(L, e_)
    local u = eI.native_Localize_FindSafe(L)
    local f0 = eI.new_charbuffer(e_ or 1024)
    eI.native_Localize_ConvertUnicodeToAnsi(u, f0, e_ or 1024)
    return f0 and c.string(f0) or nil
end;
function eJ.draw_text_shadow(x, y, r, g, b, a9, eX, eQ)
    eI.native_Surface_DrawSetTextPos(x, y)
    if eX ~= nil then
        eI.native_Surface_DrawSetTextFont(eX)
    end ;
    eI.native_Surface_DrawSetTextColor(r, g, b, a9)
    return eJ.draw_print_text(eQ, false)
end;
function eJ.draw_text(x, y, r, g, b, a9, eX, eQ, f1)
    if f1 then
        local aN, aO = eJ.get_text_size(eX, eQ)
        eJ.draw_text_shadow(x + aO / 100 + 1, y + aN / 100 + 1, 50, 50, 50, a9, eX, eQ)
    end ;
    eI.native_Surface_DrawSetTextPos(x, y)
    if eX ~= nil then
        eI.native_Surface_DrawSetTextFont(eX)
    end ;
    eI.native_Surface_DrawSetTextColor(r, g, b, a9)
    return eJ.draw_print_text(eQ, false)
end;
function eJ.draw_localized_text(x, y, r, g, b, a9, eX, eQ)
    eI.native_Surface_DrawSetTextPos(x, y)
    eI.native_Surface_DrawSetTextFont(eX)
    eI.native_Surface_DrawSetTextColor(r, g, b, a9)
    local f2 = eI.native_Localize_FindSafe(eQ)
    return eJ.draw_print_text(f2, true)
end;
function eJ.draw_line(f3, f4, aE, aF, r, g, b, a9)
    eI.native_Surface_DrawSetColor(r, g, b, a9)
    return eI.native_Surface_DrawLine(f3, f4, aE, aF)
end;
function eJ.draw_filled_rect(x, y, aN, aO, r, g, b, a9)
    eI.native_Surface_DrawSetColor(r, g, b, a9)
    return eI.native_Surface_DrawFilledRect(x, y, x + aN, y + aO)
end;
function eJ.draw_outlined_rect(x, y, aN, aO, r, g, b, a9)
    eI.native_Surface_DrawSetColor(r, g, b, a9)
    return eI.native_Surface_DrawOutlinedRect(x, y, x + aN, y + aO)
end;
function eJ.draw_filled_outlined_rect(x, y, aN, aO, f5, f6, f7, f8, f9, fa, fb, fc)
    eI.native_Surface_DrawSetColor(f5, f6, f7, f8)
    eI.native_Surface_DrawFilledRect(x, y, x + aN, y + aO)
    eI.native_Surface_DrawSetColor(f9, fa, fb, fc)
    return eI.native_Surface_DrawOutlinedRect(x, y, x + aN, y + aO)
end;
function eJ.draw_filled_gradient_rect(x, y, aN, aO, f5, f6, f7, f8, f9, fa, fb, fc, fd)
    eI.native_Surface_DrawSetColor(f5, f6, f7, f8)
    eI.native_Surface_DrawFilledRectFade(x, y, x + aN, y + aO, 255, 0, fd)
    eI.native_Surface_DrawSetColor(f9, fa, fb, fc)
    return eI.native_Surface_DrawFilledRectFade(x, y, x + aN, y + aO, 0, 255, fd)
end;
function eJ.draw_outlined_circle(x, y, r, g, b, a9, fe, ff)
    eI.native_Surface_DrawSetColor(r, g, b, a9)
    return eI.native_Surface_DrawOutlinedCircle(x, y, fe, ff)
end;
function eJ.draw_poly_line(x, y, r, g, b, a9, fg)
    eI.native_Surface_DrawSetColor(r, g, b, a9)
    return eI.native_Surface_DrawPolyLine(eI.new_intptr(x), eI.new_intptr(y), fg)
end;
function eJ.test_font(x, y, r, g, b, a9, eX)
    local as, fh = eJ.get_text_size(eX, "a b c d e f g h i j k l m n o p q r s t u v w x y z")
    eJ.draw_text(x, y, r, g, b, a9, eX, "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 ?+ # ? ??. -")
    eJ.draw_text(x, y + fh, r, g, b, a9, eX, "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z = ! \" ?$ % & / () = ? { [ ] } \\ * ' _ : ; ~ ")
end;
function eJ.set_mouse_pos(x, y)
    return eI.native_Surface_SetCursorPos(x, y)
end;
function eJ.get_mouse_pos()
    local fi = eI.new_intptr()
    local fj = eI.new_intptr()
    eI.native_Surface_GetCursorPos(fi, fj)
    local x = tonumber(fi[0])
    local y = tonumber(fj[0])
    return x, y
end;
function eJ.unlock_cursor()
    return eI.native_Surface_UnlockCursor()
end;
function eJ.lock_cursor()
    return eI.native_Surface_LockCursor()
end;
function eJ.load_texture(fk)
    local fl = eI.native_Surface_CreateNewTextureID(false)
    eI.native_Surface_DrawSetTextureFile(fl, fk, true, true)
    local fm = eI.new_intptr()
    local fn = eI.new_intptr()
    eI.native_Surface_DrawGetTextureSize(fl, fm, fn)
    local aN = tonumber(fm[0])
    local aO = tonumber(fn[0])
    return fl, aN, aO
end;
function eJ.draw_svg(fo, x, y, aN, aO, r, g, b, a9)
    if fo == nil then
        return
    end ;
    if aN == nil then
        aN = fo[1]
    end ;
    if aO == nil then
        aO = fo[2]
    end ;
    local fp = renderer.load_svg(fo[3], aN, aO)
    renderer.texture(fp, x, y, aN, aO, r, g, b, a9)
end;
function eJ.draw_jpg(fq, x, y, aN, aO, r, g, b, a9)
    local fr = renderer.load_jpg(fq, aN, aO)
    renderer.texture(fr, x, y, aN, aO, r, g, b, a9, 'f')
end;
function eJ.draw_png(fs, x, y, aN, aO, r, g, b, a9)
    local ft = renderer.load_png(fs, aN, aO)
    renderer.texture(ft, x, y, aN, aO, r, g, b, a9, 'f')
end;
function eJ.draw_custom_svg(fo, x, y, aN, aO, r, g, b, a9)
    if fo == nil then
        return
    end ;
    if aN == nil then
        aN = fo[1]
    end ;
    if aO == nil then
        aO = fo[2]
    end ;
    local fp = renderer.load_svg(fo, aN, aO)
    return renderer.texture(fp, x, y, aN, aO, r, g, b, a9)
end;
function eJ.rectangle_outline(x, y, aN, aO, r, g, b, a9, V)
    V = V or 1;
    renderer.rectangle(x, y, aN, V, r, g, b, a9)
    renderer.rectangle(x, y + aO - V, aN, V, r, g, b, a9)
    renderer.rectangle(x, y + V, V, aO - V * 2, r, g, b, a9)
    renderer.rectangle(x + aN - V, y + V, V, aO - V * 2, r, g, b, a9)
end;
function eJ.map(fu, fv, fw, fx, fy)
    return (fu - fw) / (fv - fw) * (fx - fy) + fy
end;
function eJ.draw_con(x, y, aN, aO, a9, fz, fA, fB)
    local o = { 10, 60, 25 }
    local B = { renderer.measure_text("b", fA) }
    for i = 0, 3, 1 do
        renderer.rectangle(x + i, y + i, aN - i * 2, aO - i * 2, o[i + 1], o[i + 1], o[i + 1], a9)
    end ;
    renderer.rectangle(x + 5, y, B[1] + 7, 2, 25, 25, 25, a9)
    renderer.text(x + 8, y - 7, fz and fB[1] or 220, fz and fB[2] or 220, fz and fB[3] or 220, a9, "b", 0, fA)
end;
function eJ.line(aE, aF, aH, aI, r, g, b, a9)
    renderer.line(aE, aF, aH, aI, math.min(r + 2, 255), math.min(g + 2, 255), math.min(b + 2, 255), a9)
end;
function eJ.groupbox(fA, fC, fD)
    if cursor[2] - 24 + fD > ctx.size_y - 32 then
        cursor[1] = cursor[1] + fC + 16;
        cursor[2] = 24
    end ;
    local fE = ctx.pos_x + cursor[1]
    local fF = ctx.pos_y + cursor[2]
    local fG, fH = renderer.measure_text("b", fA:split("#")[1])
    renderer.line(fE, fF, fE + 12, fF, 0, 0, 0, ctx.alpha)
    renderer.line(fE + 14 + fG + 2, fF, fE + fC, fF, 0, 0, 0, ctx.alpha)
    renderer.line(fE + fC, fF, fE + fC, fF + fD, 0, 0, 0, ctx.alpha)
    renderer.line(fE + fC, fF + fD, fE, fF + fD, 0, 0, 0, ctx.alpha)
    renderer.line(fE, fF + fD, fE, fF, 0, 0, 0, ctx.alpha)
    renderer.line(fE + 1, fF + 1, fE + 12, fF + 1, 48, 48, 48, ctx.alpha)
    renderer.line(fE + 14 + fG + 2, fF + 1, fE + fC - 1, fF + 1, 48, 48, 48, ctx.alpha)
    renderer.line(fE + fC - 1, fF + 1, fE + fC - 1, fF + fD - 1, 48, 48, 48, ctx.alpha)
    renderer.line(fE + fC - 1, fF + fD - 1, fE + 1, fF + fD - 1, 48, 48, 48, ctx.alpha)
    renderer.line(fE + 1, fF + fD - 1, fE + 1, fF + 1, 48, 48, 48, ctx.alpha)
    renderer.text(fE + 14, fF - 6, 203, 203, 203, ctx.alpha, "b", 0, fA:split("#")[1])
end;
function eJ.draw_check(x, y, fA, fI, fB, fJ)
    renderer.rectangle(x, y, 8, 8, 0, 0, 0, fB[4])
    renderer.gradient(x + 1, y + 1, 6, 6, 60, 60, 60, fB[4], 40, 40, 40, fB[4], false)
    if fI then
        renderer.gradient(x + 1, y + 1, 6, 6, fB[1], fB[2], fB[3], fB[4], fJ[1], fJ[2], fJ[3], fJ[4], false)
    end ;
    renderer.text(x + 16, y - 3, 220, 220, 220, fB[4], "", 0, fA)
end;
function eJ.draw_slider(x, y, aN, fA, fK, fL, fM, fN, fO, fB, fJ)
    local fP = fA ~= "" and fA ~= " " and fA ~= nil and 15 or 0;
    local fQ = fB[4] - 90;
    fQ = fQ >= 0 and fQ or 0;
    if fA ~= "" and fA ~= " " and fA ~= nil then
        renderer.text(x, y, 220, 220, 220, fB[4], "", 0, fA)
    end ;
    renderer.rectangle(x, y + 15, aN, 7, 0, 0, 0, fB[4])
    renderer.gradient(x + 1, y + 16, aN - 2, 5, 70, 70, 70, 255, 50, 50, 50, fB[4], false)
    if fN then
        renderer.gradient(x + 1 + aN / 2, y + 16, aN / 2 * fK, 5, fB[1], fB[2], fB[3], fB[4], fJ[1], fJ[2], fJ[3], fJ[4], false)
        if fO then
            renderer.text(x + aN / 2 + aN / 2 * fK, y + 20, 0, 0, 0, fQ, "cb", 0, fL .. fM)
            renderer.text(x + 2 + aN / 2 + aN / 2 * fK, y + 20, 0, 0, 0, fQ, "cb", 0, fL .. fM)
            renderer.text(x + 1 + aN / 2 + aN / 2 * fK, y + 21, 220, 220, 220, fB[4], "cb", 0, fL .. fM)
        end
    else
        renderer.gradient(x + 1, y + 16, aN * fK, 5, fB[1], fB[2], fB[3], fB[4], fJ[1], fJ[2], fJ[3], fJ[4], false)
        if fO then
            renderer.text(x + aN * fK, y + 20, 0, 0, 0, fQ, "cb", 0, fL .. fM)
            renderer.text(x + 2 + aN * fK, y + 20, 0, 0, 0, fQ, "cb", 0, fL .. fM)
            renderer.text(x + 1 + aN * fK, y + 21, 220, 220, 220, fB[4], "cb", 0, fL .. fM)
        end
    end
end;
local function bi(x, y)
    return { x = x, y = y }
end;
function eJ.drawCubeAtPoint(aj, bC, r, g, b, fR, fS)
    local fT = {}
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - aj, bC[2] - aj, bC[3] - aj)))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - aj, bC[2] + aj, bC[3] - aj)))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + aj, bC[2] - aj, bC[3] - aj)))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + aj, bC[2] + aj, bC[3] - aj)))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - aj, bC[2] - aj, bC[3] + aj)))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + aj, bC[2] - aj, bC[3] + aj)))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - aj, bC[2] + aj, bC[3] + aj)))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + aj, bC[2] + aj, bC[3] + aj)))
    for i = 1, #eH.CubeOutlineConnections do
        local fU = fT[eH.CubeOutlineConnections[i][1]]
        local fV = fT[eH.CubeOutlineConnections[i][2]]
        if fU.x and fU.y and fV.x and fV.y then
            renderer.line(fU.x, fU.y, fV.x, fV.y, r, g, b, fR)
        end
    end ;
    for i = 1, #eH.CubeFillConnections do
        local fU = fT[eH.CubeFillConnections[i][1]]
        local fV = fT[eH.CubeFillConnections[i][2]]
        local fW = fT[eH.CubeFillConnections[i][3]]
        if fU.x and fU.y and fV.x and fV.y and fW.x and fW.y then
            renderer.triangle(fU.x, fU.y, fV.x, fV.y, fW.x, fW.y, r, g, b, fS)
        end
    end
end;
function eJ.drawCube(bC, fX, r, g, b, fR, fS)
    local fT = {}
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - fX[1], bC[2] - fX[2], bC[3] - fX[3])))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - fX[1], bC[2] + fX[2], bC[3] - fX[3])))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + fX[1], bC[2] - fX[2], bC[3] - fX[3])))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + fX[1], bC[2] + fX[2], bC[3] - fX[3])))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - fX[1], bC[2] - fX[2], bC[3] + fX[3])))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + fX[1], bC[2] - fX[2], bC[3] + fX[3])))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] - fX[1], bC[2] + fX[2], bC[3] + fX[3])))
    table.insert(fT, bi(renderer.world_to_screen(bC[1] + fX[1], bC[2] + fX[2], bC[3] + fX[3])))
    for i = 1, #eH.CubeOutlineConnections do
        local fU = fT[eH.CubeOutlineConnections[i][1]]
        local fV = fT[eH.CubeOutlineConnections[i][2]]
        if fU.x and fU.y and fV.x and fV.y then
            renderer.line(fU.x, fU.y, fV.x, fV.y, r, g, b, fR)
        end
    end ;
    for i = 1, #eH.CubeFillConnections do
        local fU = fT[eH.CubeFillConnections[i][1]]
        local fV = fT[eH.CubeFillConnections[i][2]]
        local fW = fT[eH.CubeFillConnections[i][3]]
        if fU.x and fU.y and fV.x and fV.y and fW.x and fW.y then
            renderer.triangle(fU.x, fU.y, fV.x, fV.y, fW.x, fW.y, r, g, b, fS)
        end
    end
end;
function eJ.drawCrossAtPoint(aj, bC, r, g, b, fY)
    local fZ = aj * 0.75;
    local x, y = renderer.world_to_screen(bC)
    if x and y then
        eJ.draw_outlined_rect(x + fZ, y + fZ, x + aj + fZ, y + aj + fZ, r, g, b, fY, fY)
        eJ.draw_outlined_rect(x - fZ, y - fZ, x - (aj + fZ), y - (aj + fZ), r, g, b, fY, fY)
        eJ.draw_outlined_rect(x + fZ, y - fZ, x + aj + fZ, y - (aj + fZ), r, g, b, fY, fY)
        eJ.draw_outlined_rect(x - fZ, y + fZ, x - (aj + fZ), y + aj + fZ, r, g, b, fY, fY)
    end
end;
local f_ = database.read('mariolua_db') or {}
eH.svg_patterns = {}
local function g0(g1, g2)
    local fo = [[
<svg width="]] .. g1 .. [[" height="]] .. g2 .. [[" viewBox="0 0 ]] .. g1 .. [[ ]] .. g2 .. [[">
<rect width="]] .. g1 .. [[" height="]] .. g2 .. [[" y="0" x="0" fill="#151515"/>
#pattern
</svg>
]]
    for x = 0, g1, 4 do
        for y = 0, g2, 4 do
            local g3 = [[
<rect height="3" width="1" x="]] .. x + 1 .. [[" y="]] .. y .. [[" fill="#0d0d0d"/>
<rect height="1" width="1" x="]] .. x + 3 .. [[" y="]] .. y .. [[" fill="#0d0d0d"/>
<rect height="2" width="1" x="]] .. x + 3 .. [[" y="]] .. y + 2 .. [[" fill="#0d0d0d"/>
]]
            fo = fo:gsub("#pattern", g3 .. "#pattern")
        end
    end ;
    fo = fo:gsub("#pattern\n", "")
    return fo
end;
local function g4(x, y, aN, aO, a9)
    x, y, aN, aO = x + 6, y + 6, aN - 12, aO - 12;
    eJ.draw_filled_rect(x, y, aN, aO, 20, 20, 20, a9)
    for x = x, x + aN - 3, 4 do
        for y = y, y + aO - 3, 4 do
            eJ.draw_filled_rect(x + 1, y, 1, 3, 12, 12, 12, a9)
            eJ.draw_filled_rect(x + 3, y, 1, 1, 12, 12, 12, a9)
            eJ.draw_filled_rect(x + 3, y + 2, 1, 2, 12, 12, 12, a9)
        end
    end
end;
function eJ.gs_container(x, y, aN, aO, a9, g5, g6)
    g6 = g6 or false;
    g5 = g5 or false;
    a9 = a9 or 255;
    eJ.rectangle_outline(x, y, aN, aO, 18, 18, 18, a9)
    eJ.rectangle_outline(x + 1, y + 1, aN - 2, aO - 2, 62, 62, 62, a9)
    eJ.rectangle_outline(x + 2, y + 2, aN - 4, aO - 4, 44, 44, 44, a9, 3)
    eJ.rectangle_outline(x + 5, y + 5, aN - 10, aO - 10, 62, 62, 62, a9)
    if g6 then
        local g7, g8, g9, ga = aN - 12, aO - 12, 0;
        for i = 6, 2, -1 do
            ga = 2 ^ i;
            if g7 % ga < 7 then
                break
            end
        end ;
        for i = 1, 2 do
            if eH.svg_patterns[ga] == nil or eH.svg_patterns[ga][g8] == nil then
                eH.svg_patterns[ga] = eH.svg_patterns[ga] or {}
                if f_.gs_pattern_w ~= ga and f_.gs_pattern_h ~= g8 then
                    f_.gs_pattern_w = ga;
                    f_.gs_pattern_h = g8;
                    f_.gs_pattern = g0(ga, g8)
                    database.write('mariolua_db', f_)
                end ;
                eH.svg_patterns[ga][g8] = renderer.load_svg(f_.gs_pattern, ga, g8) or -1
            end ;
            if eH.svg_patterns[ga][g8] ~= -1 then
                for gb = 0, g7 - ga, ga do
                    renderer.texture(eH.svg_patterns[ga][g8], x + 6 + gb + g9, y + 6, ga, g8, 255, 255, 255, a9)
                end
            end ;
            if g7 % ga == 0 then
                break
            end ;
            g9, ga = g7 - g7 % ga, g7 % ga;
            g7 = ga
        end
    else
        renderer.rectangle(x + 6, y + 6, aN - 12, aO - 12, 25, 25, 25, a9)
    end ;
    if g5 then
        local x, y = x + 7, y + 7;
        local b1, b3 = math.floor((aN - 14) / 2), math.ceil((aN - 14) / 2)
        for i = 1, 2 do
            renderer.gradient(x, y, b1, 1, 59, 175, 222, a9, 202, 70, 205, a9, true)
            renderer.gradient(x + b1, y, b3, 1, 202, 70, 205, a9, 201, 227, 58, a9, true)
            y, a9 = y + 1, a9 * 0.2
        end
    end
end;
function eJ.gs_indicator_container(x, y, aN, aO, a9, g5)
    g5 = g5 or false;
    a9 = a9 or 255;
    eJ.rectangle_outline(x, y, aN, aO, 18, 18, 18, a9)
    eJ.rectangle_outline(x + 1, y + 1, aN - 2, aO - 2, 62, 62, 62, a9)
    eJ.rectangle_outline(x + 2, y + 2, aN - 4, aO - 4, 44, 44, 44, a9, 3)
    eJ.rectangle_outline(x + 5, y + 5, aN - 10, aO - 10, 62, 62, 62, a9)
    eJ.draw_filled_rect(x + 6, y + 6, aN - 12, aO - 12, 25, 25, 25, a9)
    if g5 then
        local x, y = x + 7, y + 7;
        local b1, b3 = math.floor((aN - 14) / 2), math.ceil((aN - 14) / 2)
        for i = 1, 2 do
            renderer.gradient(x, y, b1, 1, 59, 175, 222, a9, 202, 70, 205, a9, true)
            renderer.gradient(x + b1, y, b3, 1, 202, 70, 205, a9, 201, 227, 58, a9, true)
            y, a9 = y + 1, a9 * 0.2
        end
    end
end;
local eG = ui.reference("misc", "settings", "menu color")
function eJ.watermark_container(x, y, aN, aO, a9, g5, gc)
    gc = gc or ''
    local r, g, b, a9 = ui.get(eG)
    renderer.rectangle(x, y, aN, aO, 30, 30, 30, 200)
    renderer.rectangle(x + 1, y + 1, aN - 2, 1, r, g, b, 255)
    renderer.text(x + aN / 100 * 5, y + 5, r, g, b, 255, 'b', 0, gc)
end;
function eJ.watermark_container_title(x, y, aN, aO, a9, gc, g5)
    local r, g, b, a9 = ui.get(eG)
    renderer.rectangle(x, y, aN, aO, 30, 30, 30, 200)
    renderer.rectangle(x + 1, y + 1, aN - 2, 1, r, g, b, 255)
    renderer.text(x + aN / 10, y + 12.5, aN, aO, 250, 250, 250, 255, "c", 0, gc)
    if g5 == true then
    end
end;
function eJ.draw_minimal_container(x, y, aN, aO, r, g, b, a9, gc, g5)
    eJ.draw_filled_rect(x, y, aN, 25, 46, 43, 50, 200)
    renderer.text(x + aN / 2, y + 12.5, r, g, b, 255, "c", 0, gc)
    eJ.draw_filled_rect(x, y + 30, aN, aO, 46, 43, 50, 200)
    if g5 == true then
        renderer.gradient(x + 2, y + 2, aN / 2, 1, 59, 175, 222, 255, 202, 70, 205, 255, true)
        renderer.gradient(x + aN / 2 - 1, y + 2, aN / 2 - 2, 1, 202, 70, 205, 255, 201, 227, 58, 255, true)
    end
end;
function eJ.gs_container_2(x, y, aN, aO, a9, g5)
    local o = { 10, 60, 40, 40, 40, 60, 20 }
    local gd = function(x, y, aN, aO, r, g, b, a9)
        renderer.line(x, y, x + aN, y, r, g, b, a9)
        renderer.line(x, y, x, y + aO, r, g, b, a9)
        renderer.line(x, y + aO, x + aN, y + aO, r, g, b, a9)
        renderer.line(x + aN, y + aO, x + aN, y, r, g, b, a9)
    end;
    for i = 0, 6, 1 do
        gd(x + i, y + i, aN - i * 2, aO - i * 2, o[i + 1], o[i + 1], o[i + 1], 200)
    end ;
    renderer.rectangle(x + 6, y + 6, aN - 12, aO - 12, 25, 25, 25, 245)
    local ge = { math.floor(math.sin(globals.realtime() * 2) * 127 + 128), math.floor(math.sin(globals.realtime() * 2 + 2) * 127 + 128), math.floor(math.sin(globals.realtime() * 2 + 4) * 127 + 128) }
    renderer.gradient(x + 10, y + 16, aN - 20, 2, ge[1], ge[2], ge[3], 255, ge[3], ge[2], ge[1], 255, true)
    renderer.rectangle(x + 10, y + 20, aN - 20, aO - 30, 20, 20, 20, 245)
    gd(x + 10, y + 20, aN - 20, aO - 30, 40, 40, 40, 245)
end;
function eJ.shadow_container(x, y, aN, aO, a9, g5)
    local r, g, b = 1, 1, 1;
    eJ.draw_filled_gradient_rect(x + aN / 2, y + 6, aN - aN / 2, aO - 12, r, g, b, 100, r, g, b, 0, true)
    eJ.draw_filled_gradient_rect(x, y + 6, aN - aN / 2, aO - 12, r, g, b, 0, r, g, b, 100, true)
end;
function eJ.container(x, y, aN, aO, fY, g5)
    local r, g, b, a9 = ui.get(eG)
    eJ.draw_filled_rect(x, y, aN, aO, 30, 30, 30, 200)
    eJ.draw_filled_rect(x + 1, y + 1, aN - 2, 1, r, g, b, 255)
end;
function eJ.indicator_circle(ctx, x, y, r, g, b, a9, bV, gf)
    local gf = gf == nil and true or gf;
    local fe = 9;
    local gg = 0;
    if gf then
        client.draw_circle_outline(ctx, x, y, 0, 0, 0, 200, fe, gg, 1.0, 5)
    end ;
    client.draw_circle_outline(ctx, x, y, r, g, b, a9, fe - 1, gg, bV, 3)
end;
function eJ.circle_3d(x, y, bI, fe, gh, gi, r, g, b, a9, gj, gk)
    gj = gj or 1;
    gk = gk or 5;
    local gl = { x, y }
    for gm = gi, gh + gi, gk do
        local gn = math.rad(gm)
        local go = { ['x'] = fe * math.cos(gn) + x, ['y'] = fe * math.sin(gn) + y, ['z'] = bI }
        local gp = { x, y }
        gp.x, gp.y = renderer.world_to_screen(go.x, go.y, go.z)
        if gp.x ~= nil and gl.x ~= nil then
            renderer.line(gp.x, gp.y, gl.x, gl.y, r, g, b, a9)
            if gj > 1 then
                for i = 1, gj do
                    renderer.line(gp.x + i, gp.y + i, gl.x + i, gl.y + i, r, g, b, a9)
                end
            end
        end ;
        gl.x, gl.y = gp.x, gp.y
    end
end;
function eJ.drawAntiAimArrow(ch, x, y, d_)
    if x and y then
        local gq = bH(entity.get_prop(e, "m_vecAbsOrigin"))
        local gr = bH(entity.get_prop(ch, "m_vecOrigin"))
        local cg = d.get_FOV(bH(0, entity.get_prop(ch, "m_angEyeAngles[1]"), 0), gr, gq)
        local gs = cg >= 0 and cg <= 90 and true or false;
        local gt = entity.get_prop(ch, "m_flPoseParameter", 11) or 0;
        local d_ = math.max(-60, math.min(60, au.round(gt * 120 - 60 + 0.5, 1)))
        local gu = math.floor(math.abs(d_))
        local fY = 1 + math.sin(math.abs(-math.pi + globals.realtime() * 1 / 0.5 % (math.pi * 2))) * 219;
        if d_ > 0 then
            renderer.text(x + 20, y - 5, 124, 195, 13, fY, "c+", 0, gs and dO['left_2'] or dO['right_2'])
        elseif d_ < 0 then
            renderer.text(x - 20, y - 5, 250, 120, 170, fY, "c+", 0, gs and dO['right_2'] or dO['left_2'])
        end
    end
end;
function eJ.rounded_rect(x, y, aN, aO, r, g, b, a9, gv)
    if y == nil then
        return
    end ;
    renderer.rectangle(x, y, aN, aO, r, g, b, a9)
    renderer.rectangle(x, y - 5, aN, 5, r, g, b, a9)
    renderer.rectangle(x, y + aO, aN, 5, r, g, b, a9)
    if gv ~= "l" then
        renderer.circle(x, y, r, g, b, a9, 5, -180, 0.25)
        renderer.circle(x, y + aO, r, g, b, a9, 5, -90, 0.25)
        renderer.rectangle(x - 5, y, 5, aO, r, g, b, a9)
    end ;
    if gv ~= "r" then
        renderer.circle(x + aN, y + aO, r, g, b, a9, 5, 0, 0.25)
        renderer.circle(x + aN, y, r, g, b, a9, 5, 90, 0.25)
        renderer.rectangle(x + aN, y, 5, aO, r, g, b, a9)
    end
end;
function eJ.triangle(gw, gx, gy, r, g, b, a9)
    local function i(Z, l, bN)
        local gz = (l.y - Z.y) * (bN.x - l.x) - (l.x - Z.x) * (bN.y - l.y)
        if gz < 0 then
            return true
        end ;
        return false
    end;
    if i(gw, gx, gy) then
        renderer.triangle(gw.x, gw.y, gx.x, gx.y, gy.x, gy.y, r, g, b, a9)
    elseif i(gw, gy, gx) then
        renderer.triangle(gw.x, gw.y, gy.x, gy.y, gx.x, gx.y, r, g, b, a9)
    elseif i(gx, gy, gw) then
        renderer.triangle(gx.x, gx.y, gy.x, gy.y, gw.x, gw.y, r, g, b, a9)
    elseif i(gx, gw, gy) then
        renderer.triangle(gx.x, gx.y, gw.x, gw.y, gy.x, gy.y, r, g, b, a9)
    elseif i(gy, gw, gx) then
        renderer.triangle(gy.x, gy.y, gw.x, gw.y, gx.x, gx.y, r, g, b, a9)
    else
        renderer.triangle(gy.x, gy.y, gx.x, gx.y, gw.x, gw.y, r, g, b, a9)
    end
end;
function eJ.custom_triangle(x, y, r, g, b, a9, aj, gA, bz)
    for i = 0, aj do
        if bz == 1 then
            renderer.line(x + i + 1 - aj / 2, y - i / gA + 1, x + i + 1 - aj / 2, y + i / gA + 1, 2, 2, 2, a9 - 200)
            renderer.line(x + i - aj / 2, y - i / gA, x + i - aj / 2, y + i / gA, r - i * 5, g, b, a9)
        elseif bz == 2 then
            renderer.line(x - i - 1 + aj / 2, y - i / gA + 1, x - i - 1 + aj / 2, y + i / gA + 1, 2, 2, 2, a9 - 200)
            renderer.line(x - i + aj / 2, y - i / gA, x - i + aj / 2, y + i / gA, r - i * 5, g, b, a9)
        elseif bz == 3 then
            renderer.line(x + i / gA + 1, y - i - 1, x - i / gA + 1, y - i - 1, 2, 2, 2, a9 - 200)
            renderer.line(x + i / gA, y - i, x - i / gA, y - i, r - i * 5, g, b, a9)
        elseif bz == 4 then
            renderer.line(x + i / gA + 1, y + i - 1, x - i / gA + 1, y + i - 1, 2, 2, 2, a9 - 200)
            renderer.line(x + i / gA, y + i, x - i / gA, y + i, r - i * 5, g, b, a9)
        end
    end
end;
function eJ.circle(eu, ev, fe, gB, gC, r, g, b, a9)
    local gD, sy;
    gD = eu + math.sin(0) * fe;
    sy = ev + math.cos(0) * fe;
    for i = 0, gB, gC do
        local a_ = i * math.pi / 180;
        local gE = eu + math.sin(a_) * fe;
        local gF = ev + math.cos(a_) * fe;
        if gD ~= nil and gE ~= nil and sy ~= nil and gF ~= nil then
            renderer.line(gD, sy, gE, gF, r, g, b, a9)
        end ;
        gD = gE;
        sy = gF
    end
end;
function eJ.draw_bar(x, y, aN, r, g, b, a9, bV, gG, gH, gf)
    local gG = gG == nil and true or gG;
    local gH = gH == nil and false or gH;
    local gf = gf == nil and true or gf;
    local aO = 4;
    if not (gf and (aN > 2 and aO > 2) or (aN > 0 or aO > 0)) then
    end ;
    local bV = math.max(0, math.min(1, bV))
    local gI, gJ = x, y;
    local gK, gL = aN, aO;
    local gM, gN = 0, 0;
    if gf then
        gK, gL = gK - 2, gL - 2;
        gI, gJ = gI + 1, gJ + 1
    end ;
    local gO = gK;
    gK, gL = math.ceil(gK * bV), gL;
    if gH then
        gM = gO - gK
    end ;
    if not gG then
        aN, aO = aO, aN;
        gK, gL = gL, gK;
        gM, gN = gN, gM
    end ;
    local gP, gQ, gR, gS = 16, 16, 16, 170;
    if gf then
        renderer.rectangle(x, y, aN, aO, gP, gQ, gR, gS)
    end ;
    renderer.rectangle(gI + gM, gJ + gN, gK, gL, r, g, b, a9)
    return gI + gM, gJ + gN, gK, gL
end;
function eJ.draw_polygon(gT, r, g, b, a9, ff)
    for gU, gV in pairs(gT) do
        local gW = gT[gU + 1]
        if gW == nil then
            gW = gT[1]
        end ;
        local gX, gY = gV:ray(gW, ff or 64)
        if gX ~= nil and gY ~= nil then
            renderer.line(gX.x, gX.y, gY.x, gY.y, r, g, b, a9)
        end
    end
end;
function eJ.draw_line(gZ, g_, h0, h1, r, g, b, a9)
    if gZ and g_ then
        renderer.line(gZ, g_, h0, h1, r, g, b, a9)
    end
end;
function eJ.multi_container(x, y, aN, aO, g5, h2, h3, h4, at, h5, h6, h7)
    local r, g, b, a9 = 44, 48, 54, 140;
    local aI = y + aO + 4;
    local h8 = 120;
    if ui.is_menu_open() then
        renderer.rectangle(x - h8 - 2, aI - 2, aN + h8 + 4, aO * #at + 4, 0, 0, 0, 50)
        renderer.rectangle(x - h8, aI, aN + h8, aO * #at, r, g, b, a9)
        renderer.rectangle(x - h8, aI, aN + h8, aO * #at, r, g, b, a9)
    else
        renderer.rectangle(x - 2, aI - 2, aN + 4, aO * #at + 4, 0, 0, 0, 50)
        renderer.rectangle(x, aI, aN, aO * #at, r, g, b, a9)
        renderer.rectangle(x, aI, aN, aO * #at, r, g, b, a9)
    end ;
    for i = 1, #at do
        y_text = y + 10 + aO * i;
        x_text = x + 8;
        if ui.is_menu_open() then
            renderer.text(x_text - h8, y_text, 255, 255, 255, 255, nil, 0, at[i])
            renderer.text(x - h8 + aN / 3, y_text, 255, 255, 255, 255, nil, 0, h5[i])
            renderer.text(x - h8 + aN / 1.5, y_text, 255, 255, 255, 255, nil, 0, h6[i])
            renderer.text(x - h8 + aN / 1.1, y_text, 255, 255, 255, 255, nil, 0, h7[i])
        else
            renderer.text(x_text, y_text, 255, 255, 255, 255, nil, 0, at[i])
            renderer.text(x + aN / 2.6, y_text, 255, 255, 255, 255, nil, 0, h5[i])
            renderer.text(x + aN / 1.4, y_text, 255, 255, 255, 255, nil, 0, h6[i])
        end
    end ;
    if ui.is_menu_open() then
        renderer.rectangle(x - h8, y, aN + h8, aO, r, g, b, a9)
        renderer.text(x - h8 + 8, y + 4, 255, 255, 255, 255, nil, 0, g5)
        renderer.text(x - h8 + aN / 3, y + 4, 255, 255, 255, 255, nil, 0, h2)
        renderer.text(x - h8 + aN / 1.5, y + 4, 255, 255, 255, 255, nil, 0, h3)
        renderer.text(x - h8 + aN / 1.1, y + 4, 255, 255, 255, 255, nil, 0, h4)
    else
        renderer.rectangle(x, y, aN, aO, r, g, b, a9)
        renderer.text(x + 8, y + 4, 255, 255, 255, 255, nil, 0, g5)
        renderer.text(x + aN / 2.6, y + 4, 255, 255, 255, 255, nil, 0, h2)
        renderer.text(x + aN / 1.4, y + 4, 255, 255, 255, 255, nil, 0, h3)
    end
end;
eH.slider_value = {}
function eJ.Slider(h9, ha, aN, aO, hb, hc, hd, he, hf)
    local hg = { pos = { x = h9 or 0, y = ha or 0 }, width = aN or 100, height = aO or 24, min_val = hd, max_val = he, def_val = hc, relative_pos = relative_pos or nil, circle_pos = aN * hc / he or 0, x_var = x_var or nil, label = hb, isHovered = isHovered or nil, isClicked = isClicked or nil, holding_slider = holding_slider or nil, released_slider = released_slider or nil, index = hf }
    local hh, hi = renderer.measure_text('c', hg.label)
    local hj = hg.pos.y + hi + 6;
    local hk = hg.pos.x + 6;
    if eH.used_Object == nil then
        eH.used_Object = ''
    end ;
    if hg.x_var == nil then
        if (au.inBounds(hk, hj, hk + hg.width, hj + hg.height) or hg.isClicked) and (eH.used_Object == "" or eH.used_Object == hg.label .. hg.index) then
            hg.isHovered = true;
            if client.key_state(1) then
                eH.used_Object = hg.label .. hg.index;
                hg.isClicked = true
            else
                eH.used_Object = ""
                hg.isClicked = false
            end ;
            if client.key_state(1) and hg.holding_slider ~= true then
                hg.holding_slider = true
            elseif not client.key_state(1) and hg.holding_slider ~= false then
                hg.holding_slider = false;
                hg.released_slider = true;
                if hg.released_slider then
                    hg.released_slider = false
                end
            end
        else
            if hg.isClicked and not client.key_state(1) then
                eH.used_Object = ""
                hg.isClicked = false
            end ;
            hg.isHovered = false
        end ;
        if hg.x_var == nil and hg.def_val == nil then
            hg.x_var = 0
        elseif hg.def_val ~= nil and hg.x_var == nil then
            hg.x_var = hg.def_val
        end ;
        if hg.isClicked then
            hg.relative_pos = au.clamp(eH.mouse_x - hk, hg.min_val, hg.width)
            local hl = hg.relative_pos / hg.width * hg.max_val;
            hg.x_var = au.round(hl)
            hg.circle_pos = hg.width * hg.x_var / hg.max_val
        else
            hg.circle_pos = hg.width * hg.x_var / hg.max_val
        end
    end ;
    renderer.circle_outline(hk + hg.width, hj + hg.height / 2, 53, 53, 53, 255, hg.height / 2 - 2, 0, 1, hg.height / 2)
    renderer.circle_outline(hk, hj + hg.height / 2, 151, 151, 151, 255, hg.height / 2 - 2, 0, 1, hg.height / 2)
    renderer.rectangle(hk, hj + 2, hg.circle_pos, hg.height - 4, 151, 151, 151, 255)
    renderer.rectangle(hk + hg.circle_pos, hj + 2, hg.width - hg.circle_pos, hg.height - 4, 53, 53, 53, 255)
    eJ.draw_svg(eJ.gpx.svg['slider_circle'], hk + hg.circle_pos - 6, hj, hg.height, hg.height, 255, 255, 255, 255)
    local hm, hn = renderer.measure_text('b', au.round(hg.x_var))
    if hg.isClicked then
        renderer.text(hk + hg.circle_pos - hm / 2, hj - hn - hn / 2, 240, 240, 240, 255, 'b', 0, au.round(hg.x_var, 0))
    else
        renderer.text(hk + hg.circle_pos - hm / 2, hj + hg.height, 220, 220, 220, 240, 'b', 0, au.round(hg.x_var, 0))
    end ;
    eH.slider_value[hg.index] = au.clamp(hg.x_var, hg.min_val, hg.max_val)
end;
function eJ.watermark_container(x, y, aN, aO, a9, g5, gc)
    gc = gc or ''
    local r, g, b, a9 = ui.get(eG)
    renderer.rectangle(x, y, aN, aO, 30, 30, 30, 200)
    renderer.rectangle(x + 1, y + 1, aN - 2, 1, r, g, b, 255)
    renderer.text(x + aN / 100 * 5, y + 5, r, g, b, 255, 'b', 0, gc)
end;
function eJ.aimware_container(x, y, aN, aO, a9, g5)
    eJ.draw_svg(eJ.gpx.svg['window_top'], x, y + 2, aN, 8, 255, 255, 255, a9)
    eJ.draw_svg(eJ.gpx.svg['window_bottom'], x, y - 4 + aO, aN, 2, 255, 255, 255, a9)
    eJ.draw_filled_rect(x, y + 6, aN, aO - 8, 20, 20, 20, au.clamp(a9 - 100, 0, 150))
end;
function eJ.aimware_container2(x, y, aN, aO, a9, gc, g5)
    eJ.draw_svg(eJ.gpx.svg['window_top'], x, y + 2, aN, 8, 255, 255, 255, a9)
    eJ.draw_svg(eJ.gpx.svg['window_bottom'], x, y - 4 + aO, aN, 2, 255, 255, 255, a9)
    renderer.text(x + aN / 2, y + 12.5, r, g, b, 255, "c", 0, gc)
    eJ.draw_filled_rect(x, y + 6, aN, aO - 8, 20, 20, 20, au.clamp(a9 - 100, 0, 150))
end;
function eJ.draw_radar_container(x, y, aN, aO)
    local o = { 10, 60, 40, 40, 40, 60, 20 }
    for i = 0, 6, 1 do
        eJ.draw_outlined_rect(x + i, y + i, aN - i * 2, aO - i * 2, o[i + 1], o[i + 1], o[i + 1], 255)
    end
end;
function eJ.draw_radar()
    local ho, hp = 400, 100;
    local e = entity.get_local_player()
    local hq, hr, hs = entity.get_prop(e, "m_vecOrigin")
    local ht = entity.get_prop(e, "m_angEyeAngles[1]")
    local aj = 150;
    eJ.draw_radar_container(ho - aj / 2, hp - aj / 2, aj, aj)
    eJ.draw_outlined_rect(ho - 2, hp - 2, 4, 4, 255, 255, 255, 255)
    local hu = entity.get_all()
    for i = 1, #hu do
        local eo = hu[i]
        local hv, hw, hx = entity.get_prop(eo, "m_vecOrigin")
        hv = hq - hv;
        hw = hr - hw;
        local ca = min(d.get_length(hv, hw) * 0.02 * 1.5, 300)
        local hy, hz = d.normalize(hv, hw)
        hy, hz = hy * ca, hz * ca;
        hy, hz = hy + ho, hz + hp;
        local hA, hB = d.rotate_point(hy, hz, ho, hp, ht - 90)
        eJ.draw_outlined_rect(hA - 3, hB - 3, 6, 6, 255, 0, 0, 255)
    end
end;
return { Vector3 = bH, vector = d, Angle = dt, cangle = cH, centity = dP, cstring = cstring, cmath = au, crender = eJ, Vector2 = bi, ctable = a8, json = json, cweapon = eC }
-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\90b38bb57221\0x0000c3d6_luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
local l_0_0, l_0_1 = nil, nil
if not isTamperProtectionOn() then
  return mp.CLEAN
end
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[1]).utf8p2
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_0 = (this_sigattrlog[2]).utf8p2
  end
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = contains
local l_0_3 = l_0_1
local l_0_4 = {}
-- DECOMPILER ERROR at PC60: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC64: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC65: Overwrote pending register: R2 in 'AssignReg'

if not l_0_2 then
  return l_0_2
end
-- DECOMPILER ERROR at PC71: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC72: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC73: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R3 in 'AssignReg'

if l_0_3 then
  return l_0_3
end
-- DECOMPILER ERROR at PC80: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC81: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC83: Overwrote pending register: R4 in 'AssignReg'

local l_0_5 = {}
-- DECOMPILER ERROR at PC87: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC89: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC90: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC91: Overwrote pending register: R7 in 'AssignReg'

if ("set-mppreference")("python.exe", l_0_5) then
  return mp.CLEAN
end
local l_0_6 = contains
local l_0_7 = l_0_1
local l_0_8 = {}
-- DECOMPILER ERROR at PC104: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC108: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC111: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC112: Overwrote pending register: R10 in 'AssignReg'

if l_0_6 then
  l_0_6, l_0_8 = l_0_6(l_0_7, l_0_8), {"add-mppreference", "set-mppreference"}
  if l_0_6 then
    l_0_6 = bm
    l_0_6 = l_0_6.add_related_string
    -- DECOMPILER ERROR at PC119: Overwrote pending register: R7 in 'AssignReg'

    l_0_8 = l_0_1
    l_0_6(l_0_7, l_0_8, bm.RelatedStringBMReport)
    l_0_6 = TrackPidAndTechniqueBM
    -- DECOMPILER ERROR at PC125: Overwrote pending register: R7 in 'AssignReg'

    l_0_8 = "T1562.001"
    l_0_6(l_0_7, l_0_8, "mptamper_av")
    l_0_6 = mp
    l_0_6 = l_0_6.INFECTED
    return l_0_6
  end
end
l_0_6 = mp
l_0_6 = l_0_6.CLEAN
return l_0_6


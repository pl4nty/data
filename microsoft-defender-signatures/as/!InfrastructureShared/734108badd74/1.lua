-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\734108badd74\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((nri.GetURI)())
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = nil, nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
  l_0_2 = (string.lower)((this_sigattrlog[2]).utf8p2)
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[3]).utf8p1)
    l_0_2 = (string.lower)((this_sigattrlog[3]).utf8p2)
  end
end
local l_0_3 = l_0_0:match("(%d+%.%d+%.%d+%.%d+)")
if l_0_3 and not isPublicIP(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC125: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC126: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC127: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC128: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC129: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC130: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC131: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC132: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC133: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC134: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC135: Overwrote pending register: R7 in 'AssignReg'

if (".microsoft.com")("www.teramind.co", "gateways.workmeter.com") then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC145: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC146: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC147: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC148: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC149: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC150: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC152: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC153: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC155: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC156: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC157: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC158: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC159: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC160: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC161: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC162: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC163: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC164: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC165: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC166: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC167: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC168: Overwrote pending register: R8 in 'AssignReg'

if not ("wscript.exe")("cscript.exe", "opendns.com") then
  return mp.CLEAN
end
local l_0_6 = {}
-- DECOMPILER ERROR at PC185: Overwrote pending register: R9 in 'AssignReg'

if not (string.find)(l_0_0, "banyunjuhe.com") then
  return mp.CLEAN
end
local l_0_7, l_0_8 = (mp.CheckUrl)(l_0_0)
if l_0_7 == 1 and l_0_8 == 1 then
  return mp.CLEAN
end
local l_0_9 = SafeGetUrlReputation
do
  local l_0_10 = {}
  -- DECOMPILER ERROR at PC205: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC206: No list found for R10 , SetList fails

  -- DECOMPILER ERROR at PC207: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC209: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC212: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC215: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC216: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC217: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC220: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC221: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC222: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC225: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC226: Overwrote pending register: R10 in 'AssignReg'

  if l_0_10 and l_0_10 == 2 and l_0_10 >= 60 then
    return l_0_10
  end
  -- DECOMPILER ERROR at PC228: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC229: Overwrote pending register: R10 in 'AssignReg'

  do return l_0_10 end
  -- WARNING: undefined locals caused missing assignments!
end


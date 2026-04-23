-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ClickFixRDiaSB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 == 0 or l_0_0 > 512 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
if #l_0_1 > 512 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if not l_0_2 or l_0_3 == nil then
  return mp.CLEAN
end
if type(l_0_3) ~= "string" or #l_0_3 < 10 or #l_0_3 > 2048 then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_3)
if (string.sub)(l_0_4, 1, 7) ~= "http://" and (string.sub)(l_0_4, 1, 8) ~= "https://" then
  return mp.CLEAN
end
local l_0_5 = (string.lower)(l_0_1)
local l_0_6 = {}
-- DECOMPILER ERROR at PC111: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC112: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC113: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC114: Overwrote pending register: R9 in 'AssignReg'

if not ("powershell")("pwsh", "cmd.exe") then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC125: Overwrote pending register: R10 in 'AssignReg'

local l_0_7 = (string.gsub)(l_0_5, "%s", "cmd /c")
if #l_0_7 < 18 then
  return mp.CLEAN
end
local l_0_8 = l_0_7
local l_0_9 = {}
-- DECOMPILER ERROR at PC136: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC137: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC138: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC139: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC140: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC141: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC142: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC143: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC144: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC145: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC146: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC147: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC148: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC149: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC150: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC152: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC153: Overwrote pending register: R28 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R29 in 'AssignReg'

-- DECOMPILER ERROR at PC155: Overwrote pending register: R30 in 'AssignReg'

-- DECOMPILER ERROR at PC156: Overwrote pending register: R31 in 'AssignReg'

-- DECOMPILER ERROR at PC157: Overwrote pending register: R32 in 'AssignReg'

-- DECOMPILER ERROR at PC158: Overwrote pending register: R33 in 'AssignReg'

-- DECOMPILER ERROR at PC167: No list found for R9 , SetList fails

-- DECOMPILER ERROR at PC168: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC169: Overwrote pending register: R11 in 'AssignReg'

for l_0_13,l_0_14 in ("powershell%.exe")("cmd /k") do
  -- DECOMPILER ERROR at PC172: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R18 in 'AssignReg'

end
-- DECOMPILER ERROR at PC187: Overwrote pending register: R8 in 'AssignReg'

if #l_0_8 < 12 then
  return mp.CLEAN
end
local l_0_15, l_0_16 = (mp.CheckUrl)(l_0_3)
if l_0_15 == 1 and l_0_16 == 1 then
  return mp.CLEAN
end
local l_0_17 = {}
local l_0_18 = SafeGetUrlReputation
local l_0_19 = {}
-- DECOMPILER ERROR at PC210: No list found for R14 , SetList fails

-- DECOMPILER ERROR at PC211: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC220: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC221: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC224: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC225: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC226: Overwrote pending register: R14 in 'AssignReg'

do
  if not ((l_0_18.urls)[l_0_3]).confidence then
    local l_0_20 = not l_0_18 or not l_0_19 or not l_0_19 or 0
  end
  -- DECOMPILER ERROR at PC241: Confused about usage of register: R15 in 'UnsetPending'

  if (l_0_19 == 2 or l_0_19 == 3 or l_0_19 == 5 or l_0_19 == 6) and l_0_20 >= 60 then
    local l_0_21 = nil
    -- DECOMPILER ERROR at PC246: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC250: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC254: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC258: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC261: Overwrote pending register: R19 in 'AssignReg'

    -- DECOMPILER ERROR at PC262: Overwrote pending register: R20 in 'AssignReg'

    -- DECOMPILER ERROR at PC263: Overwrote pending register: R21 in 'AssignReg'

    -- DECOMPILER ERROR at PC264: Overwrote pending register: R22 in 'AssignReg'

    -- DECOMPILER ERROR at PC267: Overwrote pending register: R23 in 'AssignReg'

    -- DECOMPILER ERROR at PC268: Overwrote pending register: R24 in 'AssignReg'

    -- DECOMPILER ERROR at PC271: Overwrote pending register: R25 in 'AssignReg'

    -- DECOMPILER ERROR at PC272: Overwrote pending register: R26 in 'AssignReg'

    if ((l_0_19 ~= 2 or l_0_19 == 3) and l_0_19 ~= 5) or l_0_19 == 6 then
      do
        do
          set_research_data("ClickFixRDia_SB", "msiexec" .. "curl.exe" .. ("certutil")("bitsadmin") .. "||" .. ("wmic")("forfiles") .. "||" .. ("hh.exe")("ieexec"), false)
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC280: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC281: Overwrote pending register: R14 in 'AssignReg'

          do return l_0_19 end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end


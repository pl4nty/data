-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanNPMPolinRiderSA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCPT:PolinRider")
if l_0_0 ~= nil and #l_0_0 >= 4 then
  return mp.INFECTED
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or (string.sub)(l_0_1, -6) ~= ".woff2" then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilesize)()
if l_0_2 == nil or l_0_2 < 4 then
  return mp.CLEAN
end
local l_0_3 = (mp.readheader)(0, 4)
if l_0_3 == nil or tostring(l_0_3) == "wOF2" then
  return mp.CLEAN
end
do
  if l_0_2 > 65536 then
    local l_0_4, l_0_5, l_0_6 = 65536
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

  local l_0_7 = nil
  ;
  (mp.readprotection)(true)
  if (mp.readfile)(0, l_0_4) == nil then
    return mp.CLEAN
  end
  do
    local l_0_8 = nil
    if #tostring((mp.readfile)(0, l_0_4)) ~= l_0_7 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC111: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC118: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC127: Confused about usage of register: R6 in 'UnsetPending'

    if not (string.find)((string.lower)((string.gsub)(tostring((mp.readfile)(0, l_0_4)), "%s+", "")), "global%.i=[\'\"]a%d") ~= nil or not (string.find)((string.lower)((string.gsub)(tostring((mp.readfile)(0, l_0_4)), "%s+", "")), "global%[[\'\"]r[\'\"]%]=require;") ~= nil or (string.find)((string.lower)((string.gsub)(tostring((mp.readfile)(0, l_0_4)), "%s+", "")), "global%.r=require;") ~= nil or not (string.find)((string.lower)((string.gsub)(tostring((mp.readfile)(0, l_0_4)), "%s+", "")), "[\'\"]sec%-v[\'\"]:[%w_$]+%[[\'\"]_v[\'\"]%]") ~= nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC145: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC152: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC159: Confused about usage of register: R6 in 'UnsetPending'

    if not (string.find)((string.lower)((string.gsub)(tostring((mp.readfile)(0, l_0_4)), "%s+", "")), "%f[%w_$]eval%(") or not (string.find)((string.lower)((string.gsub)(tostring((mp.readfile)(0, l_0_4)), "%s+", "")), "%f[%w_$]spawn%(") or not (string.find)((string.lower)((string.gsub)(tostring((mp.readfile)(0, l_0_4)), "%s+", "")), "windowshide", 1, true) then
      return mp.CLEAN
    end
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end


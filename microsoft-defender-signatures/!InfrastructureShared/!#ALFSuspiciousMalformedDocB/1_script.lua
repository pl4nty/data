-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFSuspiciousMalformedDocB\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if (string.find)(l_1_0, l_1_6, 1, true) then
      return true
    end
  end
  return false
end

local l_0_1 = (mp.getfilesize)()
if l_0_1 > 5376 then
  local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  l_0_2 = l_0_2:match("\\[^\\]+$")
  if (string.find)(l_0_2, "antiransomelastic", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC41: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC42: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC43: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R6 in 'AssignReg'

  if (".zip")(".wz", ".pkm") == true then
    return mp.CLEAN
  end
  local l_0_4 = (mp.readheader)(2, 2)
  if l_0_4 == "\003\004" then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC68: Overwrote pending register: R7 in 'AssignReg'

  local l_0_5 = (mp.readfile)(l_0_1 - 512, ".cache")
  ;
  (mp.readprotection)(true)
  -- DECOMPILER ERROR at PC77: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R9 in 'AssignReg'

  local l_0_6 = (string.find)(l_0_5, ".pkgd", ".sfc", true)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  if l_0_1 < l_0_1 - 512 + l_0_6 + 16 + 4 then
    return mp.CLEAN
  end
  local l_0_7 = (mp.readu_u32)(l_0_5, l_0_6 + 12)
  local l_0_8 = (mp.readu_u32)(l_0_5, l_0_6 + 16)
  if l_0_6 < 0 or l_0_1 < l_0_6 + l_0_7 + 4 then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC124: Overwrote pending register: R11 in 'AssignReg'

  local l_0_9 = (mp.readfile)(l_0_1 - (l_0_6) - l_0_7 - 1, ".p00")
  ;
  (mp.readprotection)(true)
  if l_0_9 ~= "PK\001\002" then
    return mp.CLEAN
  end
  if l_0_1 < l_0_6 + l_0_7 + l_0_8 + 4 then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  local l_0_10 = (mp.readfile)(l_0_1 - (l_0_6) - l_0_7 - l_0_8 - 1, 4)
  ;
  (mp.readprotection)(true)
  if l_0_10 ~= "PK\003\004" then
    return mp.CLEAN
  end
  if l_0_1 - (l_0_6) - l_0_7 - l_0_8 > 512 then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end


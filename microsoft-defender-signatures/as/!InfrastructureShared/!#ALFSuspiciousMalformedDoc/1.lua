-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFSuspiciousMalformedDoc\1.luac 

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
if l_0_1 > 8192 then
  local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  l_0_2 = l_0_2:match("\\[^\\]+$")
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, "antiransomelastic", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC46: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC48: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R6 in 'AssignReg'

  if (".zip")("wz", "pkm") == true then
    return mp.CLEAN
  end
  local l_0_4 = (mp.readheader)(2, 2)
  if l_0_4 == "\003\004" then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC73: Overwrote pending register: R7 in 'AssignReg'

  local l_0_5 = (mp.readfile)(l_0_1 - 640, "cache")
  ;
  (mp.readprotection)(true)
  -- DECOMPILER ERROR at PC82: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R9 in 'AssignReg'

  if (string.find)(l_0_5, "pkgd", "sfc", true) or (string.find)(l_0_5, "/settings.xmlPK", 1, true) or (string.find)(l_0_5, "/core.xmlPK", 1, true) then
    return mp.INFECTED
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end


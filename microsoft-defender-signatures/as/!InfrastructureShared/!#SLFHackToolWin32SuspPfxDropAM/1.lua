-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFHackToolWin32SuspPfxDropAM\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
if not StringEndsWith(l_0_1, ".pfx") and not StringEndsWith(l_0_1, ".p12") then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC56: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC57: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("\\windows\\system32\\")("\\programdata\\microsoft\\crypto\\") do
  if (string.find)(l_0_0, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
local l_0_8 = false
local l_0_9 = {}
-- DECOMPILER ERROR at PC84: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC85: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Overwrote pending register: R6 in 'AssignReg'

for l_0_13,l_0_14 in ("\\users\\public\\")("\\temp\\") do
  -- DECOMPILER ERROR at PC89: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R11 in 'AssignReg'

  if (("\\documents\\").find)("\\music\\", l_0_14, 1, true) then
    break
  end
end
do
  local l_0_15 = {}
  -- DECOMPILER ERROR at PC110: No list found for R5 , SetList fails

  local l_0_16 = false
  -- DECOMPILER ERROR at PC112: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R8 in 'AssignReg'

  for l_0_20,l_0_21 in ("administrator.p12")("admin.pfx") do
    -- DECOMPILER ERROR at PC116: Overwrote pending register: R12 in 'AssignReg'

    if (("da.pfx").find)(l_0_1, l_0_21, 1, true) then
      break
    end
  end
  do
    if not l_0_8 and not l_0_16 then
      return mp.CLEAN
    end
    local l_0_22 = (mp.getfilesize)()
    if l_0_22 == nil or l_0_22 < 32 then
      return mp.CLEAN
    end
    if l_0_22 > 50000000 then
      return mp.CLEAN
    end
    ;
    (mp.readprotection)(false)
    local l_0_23 = (mp.readfile)(0, 64)
    ;
    (mp.readprotection)(true)
    if isnull(l_0_23) then
      return mp.CLEAN
    end
    local l_0_24 = (string.byte)(l_0_23, 1)
    if l_0_24 ~= 48 then
      return mp.CLEAN
    end
    local l_0_25 = "\006\t*†H†÷\r\001\a\001"
    if not (string.find)(l_0_23, l_0_25, 1, true) then
      return mp.CLEAN
    end
    set_research_data("susp_pfx_path", l_0_0, false)
    set_research_data("susp_pfx_name", l_0_1, false)
    set_research_data("susp_pfx_size", tostring(l_0_22), false)
    set_research_data("susp_pfx_in_path", tostring(l_0_8), false)
    set_research_data("susp_pfx_has_name", tostring(l_0_16), false)
    return mp.INFECTED
  end
end


-- Threat: !InfrastructureShared
-- Name: 3e8b3318e291e
-- Type: 21
-- Includes: BMLuaLib

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = this_sigattrlog[1].matched and this_sigattrlog[12].matched
  or this_sigattrlog[2].matched and (this_sigattrlog[13].matched or this_sigattrlog[14].matched)
  or this_sigattrlog[3].matched and this_sigattrlog[15].matched
  or this_sigattrlog[4].matched and this_sigattrlog[16].matched
if r0_0 then
  local r0_1 = bm.get_imagepath()
  if r0_1 == nil then
    return mp.CLEAN
  end
  local r0_2 = MpCommon.PathToWin32Path(r0_1)
  r0_1 = r0_2
  if r0_1 == nil then
    return mp.CLEAN
  end
  local r0_3 = string.lower(r0_1)
  r0_1 = r0_3
  r0_3 = string.find(r0_1, "\\users\\", 1, true)
  r0_3 = r0_3
    or string.find(r0_1, "\\temp\\", 1, true)
    or string.find(r0_1, "\\downloads\\", 1, true)
  if r0_3 then
    add_parents()
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN

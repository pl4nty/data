-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\126_luac 

-- params : ...
-- function num : 0
local l_0_1 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = false
  if not (sysio.IsFileExists)(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = (mp.IsKnownFriendlyFile)(l_0_1, true, false)
  if l_0_2 == true then
    return mp.CLEAN
  end
  local l_0_3 = (sysio.GetPEVersionInfo)(l_0_1)
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R4 in 'UnsetPending'

  -- DECOMPILER ERROR at PC55: Unhandled construct in 'MakeBoolean' P3

  if (l_0_3 and l_0_3 == nil) or (string.lower)(l_0_3.OriginalFilename) ~= "libcurl.dll" then
    l_0_0 = true
  end
end
do
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == true and l_0_1 ~= nil then
    (bm.add_related_file)(l_0_1)
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC70: freeLocal<0 in 'ReleaseLocals'

end


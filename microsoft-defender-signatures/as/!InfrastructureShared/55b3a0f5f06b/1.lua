-- Threat: !InfrastructureShared
-- Name: 55b3a0f5f06b
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0
if this_sigattrlog[3].matched then
  r0_0 = this_sigattrlog[3].utf8p2
end
local r0_1 = string.lower(r0_0)
local r0_2 = string.match(r0_1, "(.+)\\")
local r0_3 = bm.get_imagepath()
local r0_4
if r0_3 == nil then
  r0_4 = nil
else
  r0_4 = string.match(string.lower(MpCommon.PathToWin32Path(r0_3)), "(.+)\\") or nil
end
if r0_1 ~= nil and r0_3 ~= nil then
  if not string.find(r0_1, "^%%", 0)
    and r0_4 == r0_2
    and mp.IsKnownFriendlyFile(r0_3, true, false)
    and not mp.IsKnownFriendlyFile(r0_1, true, false) then
    local r0_5 = sysio.GetFileLastWriteTime(r0_1)
    local r0_6 = sysio.GetLastResult()
    r0_6 = r0_6.Success
    if r0_6 and r0_5 ~= 0 then
      r0_5 = r0_5 / 10000000 - 11644473600
      local r0_7 = MpCommon.GetCurrentTimeT()
      if r0_7 < r0_5 or r0_7 - r0_5 > 600 then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN

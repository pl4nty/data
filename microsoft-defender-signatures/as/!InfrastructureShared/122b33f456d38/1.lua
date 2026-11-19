-- Threat: !InfrastructureShared
-- Name: 122b33f456d38
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 150000000
if l_0_4 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
for l_0_5 = 1, l_0_0 do
  local l_0_6 = sigattr_tail[l_0_5].attribute
  if l_0_6 == 16385 and sigattr_tail[l_0_5].utf8p1 ~= nil then
    local l_0_7 = sigattr_tail[l_0_5].utf8p1
    if l_0_2[l_0_7] == nil then
      l_0_2[l_0_7] = true
      bm.add_related_file(l_0_7)
      local l_0_8 = l_0_7:match("%.[^/%.]+$")
      if l_0_8 ~= nil then
        if l_0_1[l_0_8] == nil then
          l_0_3 = l_0_3 + 1
          l_0_1[l_0_8] = 1
        else
          l_0_1[l_0_8] = l_0_1[l_0_8] + 1
        end
      end
    end
  end
end
local l_0_9 = 0
for l_0_10, l_0_11 in pairs(l_0_1) do
  if l_0_11 > l_0_9 then
    l_0_9 = l_0_11
  end
end
if l_0_3 < 3 and 5 <= l_0_9 then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_CcryptEncryption")
  RemediateProcessTreeForLinux()
  return mp.INFECTED
end
return mp.CLEAN

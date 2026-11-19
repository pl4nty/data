-- Threat: !InfrastructureShared
-- Name: 1f5b32d09f9db
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = 0
local l_0_3 = 150000000
if l_0_3 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
for l_0_4 = 1, l_0_0 do
  local l_0_5 = sigattr_tail[l_0_4].attribute
  if l_0_5 == 16385 and sigattr_tail[l_0_4].utf8p1 ~= nil then
    local l_0_6 = sigattr_tail[l_0_4].utf8p1
    if l_0_1[l_0_6] == nil then
      l_0_1[l_0_6] = true
      bm.add_related_file(l_0_6)
      if l_0_6:match("%.[^/%.]+$") == ".cpt" then
        l_0_2 = l_0_2 + 1
      end
    end
  end
end
if 10 <= l_0_2 then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_CcryptEncryption")
  return mp.INFECTED
end
return mp.CLEAN

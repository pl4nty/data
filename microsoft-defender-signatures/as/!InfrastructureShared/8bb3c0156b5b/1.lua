-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8bb3c0156b5b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if isnull(l_1_0) then
    return {}
  end
  if type(l_1_0) ~= "table" and type(l_1_0) ~= "userdata" then
    set_research_data("SC_CredentialPair_Error", "InvalidEventObject", true)
    return {}
  end
  local l_1_2, l_1_3, l_1_4, l_1_5, l_1_6, l_1_7 = pcall(function()
    -- function num : 0_0_0 , upvalues : l_1_0
    if l_1_0.matched ~= true then
      return false
    end
    return true, l_1_0.utf8p1, l_1_0.utf8p2, l_1_0.ppid, l_1_0.timestamp
  end
)
  if not l_1_2 then
    set_research_data("SC_CredentialPair_Error", "EventMetadataUnavailable", true)
    return {}
  end
  if not l_1_3 then
    return {}
  end
  if isnull(l_1_4) or type(l_1_4) ~= "string" or isnull(l_1_5) or type(l_1_5) ~= "string" or #l_1_5 > 32768 or (string.find)(l_1_5, "\000", 1, true) then
    set_research_data("SC_CredentialPair_Error", "InvalidEventParameters", true)
    return {}
  end
  if (string.lower)(l_1_4) ~= "bm_fileopen" then
    return {}
  end
  local l_1_8 = (string.match)(l_1_5, "[\\/]([^\\/]+)$", 2)
  if isnull(l_1_8) or (string.lower)(l_1_8) ~= l_1_1 then
    return {}
  end
  if isnull(l_1_6) or type(l_1_6) ~= "string" or type(l_1_7) ~= "number" or l_1_7 <= 0 or l_1_7 - l_1_7 ~= 0 then
    set_research_data("SC_CredentialPair_Error", "EventIdentityOrTimeUnavailable", true)
    return {}
  end
  local l_1_9 = {}
  l_1_9.ppid = l_1_6
  l_1_9.timestamp = l_1_7
  return l_1_9
end

local l_0_1 = l_0_0(this_sigattrlog[2], ".npmrc")
local l_0_2 = l_0_0(this_sigattrlog[1], ".git-credentials")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
if l_0_1.ppid ~= l_0_2.ppid then
  return mp.CLEAN
end
local l_0_3 = l_0_1.timestamp - l_0_2.timestamp
if l_0_3 < -6000000000 or l_0_3 > 6000000000 then
  return mp.CLEAN
end
;
(bm.add_related_string)("CredentialFileContext", "NpmAndGitFileNotifications", bm.RelatedStringBMReport)
return mp.INFECTED


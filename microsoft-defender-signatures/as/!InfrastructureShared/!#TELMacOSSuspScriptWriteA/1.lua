-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspScriptWriteA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = l_0_1 .. "/" .. l_0_2
local l_0_4 = (mp.enum_mpattributesubstring)("SCPT:XPLATScriptGen")
if l_0_4 ~= nil and type(l_0_4) == "table" and #l_0_4 > 0 then
  local l_0_5 = false
  local l_0_6 = false
  local l_0_7 = false
  if l_0_3:find("^/Users/[^/]+/Downloads/", 1, false) ~= nil or l_0_3:find("^/Users/[^/]+/Desktop/", 1, false) ~= nil or l_0_3:find("^/Users/[^/]+/[^/]+$", 1, false) ~= nil or l_0_3:find("/Library/LaunchAgents/", 1, true) ~= nil or l_0_3:find("/Library/LaunchDaemons/", 1, true) ~= nil or l_0_3:find("/Library/PrivilegedHelperTools/", 1, true) ~= nil or l_0_3:find("/Library/Application Support/[^/]+$", 1, false) ~= nil or l_0_3:find("/Library/Application Support/[^/]+/[^/]+$", 1, false) ~= nil or l_0_3:find("/Library/Caches/", 1, true) ~= nil or l_0_3:find("/Users/Shared/", 1, true) ~= nil or l_0_3:find("/var/root/[^/]+$", 1, false) ~= nil or l_0_3:find("/Library/[^/]+$", 1, false) ~= nil or l_0_3:find("/Library/[^/]+/[^/]+$", 1, false) ~= nil or l_0_3:find("^/Applications/[^/]+$", 1, false) ~= nil or l_0_3:find("^/Applications/[^/]+/[^/]+$", 1, false) ~= nil or l_0_3:find("^/private/tmp/", 1, false) ~= nil or l_0_3:find("^/private/var/tmp/", 1, false) ~= nil or l_0_3:find("^/Volumes/", 1, false) ~= nil or l_0_3:find("/Library/Fonts/", 1, true) ~= nil then
    l_0_5 = true
  end
  local l_0_8 = (string.lower)(l_0_2)
  if l_0_5 == true and (l_0_2:find("^%.", 1, false) ~= nil or l_0_8:find("apple", 1, true) ~= nil or l_0_8:find("google", 1, true) ~= nil or l_0_8:find("system", 1, true) ~= nil or l_0_8:find("update", 1, true) ~= nil or l_0_8:find("settings", 1, true) ~= nil or l_0_8:find("install", 1, true) ~= nil) then
    l_0_6 = true
  end
  if l_0_5 == true and (l_0_8:find("ds_store", 1, true) ~= nil or l_0_2:find("^%._", 1, false) ~= nil) then
    l_0_7 = true
  end
  if l_0_5 and l_0_6 and #l_0_4 > 1 then
    l_0_7 = true
  end
  if l_0_6 == true or l_0_5 == true or l_0_7 == true then
    local l_0_9 = ""
    for l_0_13,l_0_14 in ipairs(l_0_4) do
      l_0_9 = l_0_9 .. "||" .. tostring(l_0_14)
    end
    if l_0_9 ~= nil and l_0_9 ~= "" then
      set_research_data("SuspiciousAttrHits", l_0_9, false)
    end
    if l_0_5 and not l_0_7 and not l_0_6 then
      set_research_data("SuspiciousHitType", "Suspicious Path Hit", false)
    else
      if l_0_6 then
        set_research_data("SuspiciousHitType", "Suspicious Path+Name Hit", false)
      else
        if l_0_7 then
          set_research_data("SuspiciousHitType", "High Suspicious Hit", false)
        end
      end
    end
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end


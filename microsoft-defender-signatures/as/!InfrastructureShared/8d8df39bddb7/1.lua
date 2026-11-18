-- Threat: !InfrastructureShared
-- Name: 8d8df39bddb7
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetCertificateInfo()
if l_0_1 == nil or #l_0_1 < 1 then
  if string.find(l_0_0, "^/users/[^/]+/library/caches/google/chrome/", 1, false) then
    return mp.INFECTED
  end
  local l_0_2, l_0_3 = l_0_0:match("^/users/[^/]+/library/caches/([^/]+)/([^/]+)%.app/contents/macos/")
  if l_0_2 == nil then
    l_0_2, l_0_3 = l_0_0:match("^/users/[^/]+/library/application support/([^/]+)/([^/]+)%.app/contents/macos/")
  end
  if l_0_2 ~= nil then
    local l_0_4 = {
      finder = true,
      ["software update"] = true,
      ["system settings"] = true,
      ["system preferences"] = true,
      systemuiserver = true,
      dock = true,
      safari = true,
      spotlight = true,
      keychain = true
    }
    if string.find(l_0_2, "com.apple.", 1, true) == 1 or l_0_4[l_0_3] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

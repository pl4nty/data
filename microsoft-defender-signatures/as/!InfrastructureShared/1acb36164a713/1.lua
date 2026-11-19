-- Threat: !InfrastructureShared
-- Name: 1acb36164a713
-- Type: 21

if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  local l_0_0 = this_sigattrlog[5].utf8p2
  
  function ExtendedSuspMacPathsToMonitor(l_1_0)
    if l_1_0:find("^/Users/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Downloads/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/[^/]+$", 1, false) or l_1_0:find("^/tmp/[^/]+$", 1, false) or l_1_0:find("^/private/tmp/[^/]+$", 1, false) then
      return true
    end
    return false
  end
  
  if string.find(l_0_0, "/Users/Shared/.com.googlecode.munki.", 1, true) then
    return mp.CLEAN
  end
  if ExtendedSuspMacPathsToMonitor(l_0_0) then
    return mp.INFECTED
  end
end
return mp.CLEAN

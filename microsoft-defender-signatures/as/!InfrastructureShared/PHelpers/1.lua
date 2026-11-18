-- Threat: !InfrastructureShared
-- Name: PHelpers
-- Type: 1

function IsInternetCache(l_1_0)
  if l_1_0:find("\\microsoftedge\\cache\\", 1, true) or l_1_0:find("\\microsoft\\windows\\inetcache\\", 1, true) or l_1_0:find("\\google\\chrome\\user data\\default\\cache", 1, true) or l_1_0:find("\\microsoft\\windows\\temporary internet files\\", 1, true) or l_1_0:find("\\mozilla\\firefox\\profiles\\", 1, true) or l_1_0:find("\\opera software\\opera stable\\cache\\", 1, true) or l_1_0:find("\\opera autoupdate\\", 1, true) then
    return true
  end
  return false
end

function IsLowConfNPath(l_2_0)
  if l_2_0:find("microsoft\\office\\solutionpackages\\", 1, true) or l_2_0:find("\\opera software\\opera stable\\cache\\", 1, true) or l_2_0:find("\\microsoft monitoring agent\\agent\\health service state\\monitoring host\\", 1, true) or l_2_0:find("\\grouppolicy\\datastore\\", 1, true) then
    return true
  end
  return false
end

function IsChainNPath(l_3_0)
  if l_3_0:find("\\github\\", 1, true) or l_3_0:find("\\android\\", 1, true) or l_3_0:find("\\android-platform-tools\\", 1, true) or l_3_0:find("\\androidsdk\\", 1, true) or l_3_0:find("\\scoop-master\\", 1, true) or l_3_0:find("\\sql\\", 1, true) or l_3_0:find("\\tutoris\\", 1, true) or l_3_0:find("\\$windows.~bt\\", 1, true) then
    return true
  end
  return false
end

-- Threat: !InfrastructureShared
-- Name: FileExtensionCheck
-- Type: 1

function FileExtensionCheck(l_1_0, l_1_1)
  if l_1_0 ~= nil and l_1_0:len() > 5 then
    local l_1_2 = l_1_0:sub(-5):match("(%.%w+)$")
    
    if l_1_2 ~= nil and true == l_1_1[l_1_2] then
      return true
    end
  end
  return false
end

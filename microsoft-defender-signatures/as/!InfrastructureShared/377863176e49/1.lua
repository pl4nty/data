-- Threat: !InfrastructureShared
-- Name: 377863176e49
-- Type: 21

function endswith(l_1_0, l_1_1)
  return l_1_0:sub(-#l_1_1) == l_1_1
end

if peattributes.isdll and not peattributes.hasexports and endswith(string.lower(mp.getfilename()), "magentloc.dll") then
  return mp.INFECTED
end
return mp.CLEAN

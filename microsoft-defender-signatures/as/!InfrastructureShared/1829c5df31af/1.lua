-- Threat: !InfrastructureShared
-- Name: 1829c5df31af
-- Type: 21

if (string.match(string.lower(mp.getfilename()), "%.jpg$") or string.match(string.lower(mp.getfilename()), "%.jpeg$") or string.match(string.lower(mp.getfilename()), "%.png$") or string.match(string.lower(mp.getfilename()), "%.gif$")) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

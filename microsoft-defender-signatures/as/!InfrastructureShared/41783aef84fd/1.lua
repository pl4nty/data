-- Threat: !InfrastructureShared
-- Name: 41783aef84fd
-- Type: 21

if hstrlog[1].hitcount >= 3 then
  return mp.LOWFI
elseif 3 <= hstrlog[2].hitcount then
  return mp.LOWFI
elseif 3 <= hstrlog[3].hitcount then
  return mp.LOWFI
else
  return mp.CLEAN
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1b8786d644b12
-- Type: 21

if peattributes.ismsil and (hstrlog[5].matched or hstrlog[6].matched) then
  return mp.INFECTED
end
return mp.LOWFI

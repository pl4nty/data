-- Threat: !InfrastructureShared
-- Name: 8e2999da327d
-- Type: 21

if mp.getfilename():lower():find("word/embeddings/oleobject1.bin->(ole stream 0)", -46, true) then
  return mp.INFECTED
end
return mp.LOWFI

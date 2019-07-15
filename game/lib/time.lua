local time = {}

function time.now()
  os.date('%H:%M:%S %d/%m/%Y')
end

return time

class System::Object
  def to_json(encoding)
    Newtonsoft::Json::JsonConvert.SerializeObject(self)
  end
end
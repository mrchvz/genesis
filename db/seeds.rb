# TODO: Add multiple links (polymorphic) resource

def png
  random_color =
    ChunkyPNG::Color::rgba(
      rand(0..255),
      rand(0..255),
      rand(0..255),
      100
    )
  width = 200
  height = 100

  ChunkyPNG::Image.new(width, height, random_color).to_datastream.to_s
end

def payload(file_content)
  "data:image/png;base64,#{Base64.encode64(file_content)}"
end

logo = payload(png)

# ORGANIZATION
organization = Organization.new(
  name: 'Gerardo Aguiñiga',
  status: :ACTIVE,
  subdomain: 'gerardoaguiniga',
  url: 'https://www.gerardoaguiniga.com'
)

organization.save || binding.pry

[
  {
    addressable: organization,
    organization: organization,
    city: 'Tijuana',
    country_code: 'MX',
    label: 'HQ',
    line_1: 'Juventud Oriente #8800',
    line_2: 'Interior 2204',
    line_3: 'Zona Rio',
    state_province_county: 'Baja California',
    zip_postal_code: '22010'
  }
].each do |attribute_set|
  address = Address.new(attribute_set)
  address.save || binding.pry
end

[
  {
    emailable: organization,
    organization: organization,
    address: 'info@tijuanasmiledentistry.com',
    confirmed: true
  }
].each do |attribute_set|
  email = Email.new(attribute_set)
  email.save || binding.pry
end

[
  {
    imageable: organization,
    organization: organization,
    description: 'Baja Smile Dentistry Logo',
    title: 'Baja Smile Dentistry',
    payload: payload(logo),
  }
].each do |attribute_set|
  image = Image.new(attribute_set)
  image.save || binding.pry
end

[
  {
    phoneable: organization,
    organization: organization,
    confirmed: true,
    country_code: 'US',
    extension: nil,
    label: 'United States',
    number: 6194673765
  },
  {
    phoneable: organization,
    organization: organization,
    confirmed: true,
    country_code: 'MX',
    extension: nil,
    label: 'Mexico',
    number: 6642071561
  }
].each do |attribute_set|
  phone = Phone.new(attribute_set)
  phone.save || binding.pry
end

organization.primary_address = organization.addresses.first || binding.pry
organization.primary_email = organization.emails.first || binding.pry
organization.primary_image = organization.images.first || binding.pry
organization.primary_phone = organization.phones.first || binding.pry

organization.save || binding.pry

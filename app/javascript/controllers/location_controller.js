import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {
  static targets = ['selectedRegionId', 'selectedProvinceId', 'selectedCityId', 'selectedBarangayId']
  fetchProvinces() {
    let provinceTarget = this.selectedProvinceIdTarget
    $(provinceTarget).empty()

    $.ajax({
      type: 'GET',
      url: `/api/v1/regions/${this.selectedRegionIdTarget.value}/provinces`,
      dataType: 'json',
      success: (response) => {
        console.log(response)
        $.each(response, function (index, record) {
          let option = document.createElement('option')
          option.value = record.id
          option.text = record.name
          provinceTarget.appendChild(option)
        })
      }
    })
  }

  fetchCities() {
    let cityTarget = this.selectedCityIdTarget
    $(cityTarget).empty()

    $.ajax({
      type: 'GET',
      url: `/api/v1/provinces/${this.selectedProvinceIdTarget.value}/cities`,
      dataType: 'json',
      success: (response) => {
        console.log(response)
        $.each(response, function (index, record) {
          let option = document.createElement('option')
          option.value = record.id
          option.text = record.name
          cityTarget.appendChild(option)
        })
      }
    })
  }

  fetchBarangays() {
    let barangayTarget = this.selectedBarangayIdTarget
    $(barangayTarget).empty()
    console.log(this.selectedCityIdTarget)
    $.ajax({
      type: 'GET',
      url: `/api/v1/cities/${this.selectedCityIdTarget.value}/barangays`,
      dataType: 'json',
      success: (response) => {
        console.log(response)
        $.each(response, function (index, record) {
          let option = document.createElement('option')
          option.value = record.id
          option.text = record.name
          barangayTarget.appendChild(option)
        })
      }
    })
  }
}

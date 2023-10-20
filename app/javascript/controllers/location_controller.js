import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {
  static targets = ['selectedRegionId', 'selectedProvinceId']
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

  }

  fetchBarangays() {

  }
}
